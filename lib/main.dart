import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecommercialpowertest/app_logger.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/core/environment.dart';
import 'package:icecommercialpowertest/data/repository/repository.dart';
import 'package:icecommercialpowertest/data/repository/store_implementation.dart';
import 'package:icecommercialpowertest/di.dart';
import 'package:icecommercialpowertest/domain/usecases/store.dart';
import 'package:icecommercialpowertest/presentation/auth/login_page.dart';
import 'package:icecommercialpowertest/presentation/presentation.dart';
import 'package:icecommercialpowertest/presentation/store/cartbloc/cart_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

import 'presentation/store/bloc/dashboard_bloc.dart';
import 'services/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Platform.isIOS ? Colors.black : Colors.transparent,
    statusBarBrightness: Brightness.light,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  DI()
    ..add<AppNavigator>(AppNavigator(rootNavigatorKey))
    ..add<SessionStorage>(SessionStorage())
    ..add<Repository>(await buildRespository);

  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await SentryFlutter.init(
        (options) {
          options.dsn = "";
          options.tracesSampleRate = 1.0;
        },
        appRunner: () => runApp(const App()),
      );
    },
    (Object error, StackTrace stack) {
      AppLogger().error(error, stack);
    },
  );
}

Future<Repository> get buildRespository async {
  final httpClient = DioHttpClient(await dioAdapter);
  if (Env.mode.isProduction) {
    return Repository(
      store: StoreRepositoryImplement(httpClient),
      auth: AuthRepositoryImplement(httpClient),
    );
  }
  return Repository(
    store: StoreRepositoryImplement(httpClient),
    auth: AuthRepositoryImplement(httpClient),
  );
}

Future<Dio> get dioAdapter async {
  final isProd = Env.mode.isProduction;
  return Dio(
    BaseOptions(
      baseUrl: isProd ? Endpoints.baseUrlProd : Endpoints.baseUrlDev,
      headers: <String, dynamic>{
        'Device-Id': "appInfo.deviceId",
        'Device-Name': "appInfo.deviceName",
        'platform': Platform.operatingSystem,
        'app_version': "appInfo.version",
        'idempotency-key': "idempotency-${Random().nextInt(44444)}",
        "Authorization": "Bearer tokenss"
      },
    ),
  )..interceptors.add(
      InterceptorsWrapper(
        onError: _onError,
      ),
    );
}

void _onError(DioError err, ErrorInterceptorHandler handler) {
  final statusCode = err.response?.statusCode;
  final requestOption = err.requestOptions;
  switch (err.type) {
    case DioErrorType.connectTimeout:
    case DioErrorType.sendTimeout:
    case DioErrorType.receiveTimeout:
      throw TimeOutException(requestOption);
    case DioErrorType.response:
      switch (statusCode) {
        case HttpStatus.badRequest:
          throw BadRequestException(
              requestOption, err.response?.data['message']);
        case HttpStatus.unauthorized:
          DI.get.navigator.auth.toLogin();
          throw UnAuthorisedException(
            requestOption,
            err.response?.data['message'],
          );
        case HttpStatus.notFound:
          throw NotFoundException(requestOption);
        case 409:
          throw DeviceException(requestOption, err.response?.data['message']);
        case HttpStatus.unprocessableEntity:
          throw ResponseException(
            requestOption,
            err.response?.data['message'],
          );
        case 500:
          throw ResponseException(
            requestOption,
            err.response?.statusMessage,
          );
        default:
          throw ResponseException(
            requestOption,
            err.response?.statusMessage ?? err.response?.data['message'],
          );
      }
    case DioErrorType.cancel:
      break;
    case DioErrorType.other:
      DI.get.navigator.auth.toLogin();
      throw NotInternetException(requestOption);
  }
  return handler.next(err);
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final home = SplashScreen();
    return ThemeProvider(
      child: ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, _) => StateProvider(
          child: MaterialApp(
            navigatorKey: rootNavigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeProvider.of(context)!.themeData(Theme.of(context)),
            home: Env.mode.isProduction
                ? home
                : Directionality(
                    textDirection: TextDirection.ltr,
                    child: Banner(
                      color: AppColors.primary,
                      message: Env.mode.name.toUpperCase(),
                      location: BannerLocation.topStart,
                      child: home,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class StateProvider extends StatelessWidget {
  final Widget child;
  const StateProvider({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repo = DI.get.repository.store;
    return MultiBlocProvider(
      child: child,
      providers: [
        BlocProvider<DashboardBloc>(
          create: (BuildContext context) =>
              DashboardBloc(StoreUseCases(repository: repo)),
        ),
        BlocProvider<CartBloc>(
          create: (BuildContext context) =>
              CartBloc(StoreUseCases(repository: repo)),
        )
      ],
    );
  }
}

class AppLogo extends StatefulWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: AppPainter(),
      size: Size(80, 80),
    );
  }
}

class AppPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final width = size.width;
    final height = size.height;
    final center = Offset(width / 2, height / 2);
    final startAngle = Angle(100).toRadians;
    final sweepAngle = Angle(320).toRadians;
    Paint paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 8
      ..style = PaintingStyle.stroke;

    Path path = Path();
    final rect = Rect.fromCenter(center: center, width: width, height: height);
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(20));
    path.addRRect(rrect);

    final linePath = Path();
    linePath.moveTo(width * .1, height);
    linePath.lineTo(width * .8, height);

    final pathOdd = Path.combine(PathOperation.difference, path, linePath);

    canvas.drawPath(pathOdd, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    paint.color = Color(0xffF67952);
    path = Path();
    path.lineTo(size.width * 0.51, size.height * 0.72);
    path.cubicTo(size.width * 0.44, size.height * 0.72, size.width * 0.37,
        size.height * 0.7, size.width * 0.32, size.height * 0.66);
    path.cubicTo(size.width * 0.32, size.height * 0.66, size.width * 0.08,
        size.height * 0.49, size.width * 0.08, size.height * 0.49);
    path.cubicTo(-0.01, size.height * 0.43, -0.01, size.height * 0.3,
        size.width * 0.08, size.height * 0.23);
    path.cubicTo(size.width * 0.08, size.height * 0.23, size.width * 0.32,
        size.height * 0.07, size.width * 0.32, size.height * 0.07);
    path.cubicTo(size.width * 0.43, -0.01, size.width * 0.59, -0.01,
        size.width * 0.7, size.height * 0.07);
    path.cubicTo(size.width * 0.7, size.height * 0.07, size.width * 0.94,
        size.height * 0.23, size.width * 0.94, size.height * 0.23);
    path.cubicTo(size.width, size.height * 0.27, size.width * 1.02,
        size.height * 0.34, size.width, size.height * 0.41);
    path.cubicTo(size.width, size.height * 0.43, size.width * 0.97,
        size.height * 0.44, size.width * 0.95, size.height * 0.44);
    path.cubicTo(size.width * 0.92, size.height * 0.43, size.width * 0.91,
        size.height * 0.41, size.width * 0.91, size.height * 0.39);
    path.cubicTo(size.width * 0.93, size.height * 0.35, size.width * 0.91,
        size.height * 0.32, size.width * 0.88, size.height * 0.29);
    path.cubicTo(size.width * 0.88, size.height * 0.29, size.width * 0.64,
        size.height * 0.13, size.width * 0.64, size.height * 0.13);
    path.cubicTo(size.width * 0.56, size.height * 0.07, size.width * 0.45,
        size.height * 0.07, size.width * 0.38, size.height * 0.13);
    path.cubicTo(size.width * 0.38, size.height * 0.13, size.width * 0.14,
        size.height * 0.29, size.width * 0.14, size.height * 0.29);
    path.cubicTo(size.width * 0.09, size.height / 3, size.width * 0.09,
        size.height * 0.4, size.width * 0.14, size.height * 0.43);
    path.cubicTo(size.width * 0.14, size.height * 0.43, size.width * 0.38,
        size.height * 0.6, size.width * 0.38, size.height * 0.6);
    path.cubicTo(size.width * 0.45, size.height * 0.65, size.width * 0.56,
        size.height * 0.65, size.width * 0.64, size.height * 0.6);
    path.cubicTo(size.width * 0.64, size.height * 0.6, size.width * 0.68,
        size.height * 0.57, size.width * 0.68, size.height * 0.57);
    path.cubicTo(size.width * 0.7, size.height * 0.56, size.width * 0.73,
        size.height * 0.56, size.width * 0.74, size.height * 0.58);
    path.cubicTo(size.width * 0.76, size.height * 0.59, size.width * 0.76,
        size.height * 0.62, size.width * 0.74, size.height * 0.63);
    path.cubicTo(size.width * 0.74, size.height * 0.63, size.width * 0.7,
        size.height * 0.66, size.width * 0.7, size.height * 0.66);
    path.cubicTo(size.width * 0.7, size.height * 0.66, size.width * 0.7,
        size.height * 0.66, size.width * 0.7, size.height * 0.66);
    path.cubicTo(size.width * 0.64, size.height * 0.7, size.width * 0.58,
        size.height * 0.72, size.width * 0.51, size.height * 0.72);
    path.cubicTo(size.width * 0.51, size.height * 0.72, size.width * 0.51,
        size.height * 0.72, size.width * 0.51, size.height * 0.72);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
