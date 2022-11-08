import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/core/navigators/navigator.dart';
import 'package:icecommercialpowertest/domain/domain.dart';
import 'package:icecommercialpowertest/services/services.dart';
import 'package:injector/injector.dart';

import 'app_logger.dart';

//TODO: Revise DI and SL

///Dependency injector
/// This is the injector used by the app
class DI {
  DI() : _injector = Injector.appInstance {
    if (!_injector.exists<DI>()) {
      _injector.registerSingleton<DI>(() => this);
    }
  }

  static DI get get => Injector.appInstance.get<DI>();

  final Injector _injector;

  void add<T>(T instance) {
    _injector.registerDependency<T>(() => instance);
  }

  void replace<T>(T instance) {
    try {
      _injector.registerDependency<T>(() => instance, override: true);
    } catch (e) {
      AppLogger().error(e);
    }
  }

  void dispose() {
    _injector.clearAll();
  }
}

extension DIX on DI {
  SessionStorage get sessionStorage => _injector.get<SessionStorage>();
  SharedPrefs get sharedPrefs => _injector.get<SharedPrefs>();
  Repository get repository => _injector.get<Repository>();
  //Services get services => _injector.get<Services>();
  AppNavigator get navigator => _injector.get<AppNavigator>();
}

class SessionStorage {
  ValueNotifier<String> token = ValueNotifier("");
  ValueNotifier<UserModel?> user = ValueNotifier(null);
}
