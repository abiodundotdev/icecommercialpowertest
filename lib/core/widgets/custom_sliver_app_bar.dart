import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:flutter/rendering.dart';
import 'package:icecommercialpowertest/core/core.dart';

import 'app_status_bar.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({
    Key? key,
    required this.title,
    this.primary = false,
    this.automaticallyImplyLeading = true,
    this.brightness = Brightness.dark,
    this.leading,
    this.trailing,
    this.isLoading = false,
  }) : super(key: key);

  final Widget title;
  final bool primary;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  final bool isLoading;
  final Brightness brightness;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    final paddingTop = primary ? MediaQuery.of(context).padding.top : 0.0;
    const persistentHeight = kToolbarHeight;
    final minExtent = kToolbarHeight + paddingTop;
    final maxExtent = minExtent + persistentHeight;

    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? leadingWidget = leading;
    if (leading == null && automaticallyImplyLeading) {
      leadingWidget =
          useCloseButton ? const AppCloseButton() : const AppBackButton();
    }

    final titleSpace = leadingWidget != null ? 8.0.h : 24.0.h;

    return SliverPersistentHeader(
      pinned: true,
      delegate: _AppSliverPersistentHeaderDelegate(
        minExtent: minExtent,
        maxExtent: maxExtent,
        builder: (BuildContext context, double shrinkOffset,
            bool overlapsContent, bool isAtTop) {
          final flexibleMaxExtent = maxExtent - persistentHeight;
          final currentExtent =
              math.max(paddingTop, flexibleMaxExtent - shrinkOffset);
          final offset = interpolate(
              inputMin: paddingTop,
              inputMax: flexibleMaxExtent)!(currentExtent);

          final _title = AlignTransition(
            alignment: AlignmentTween(
              begin: const Alignment(-.75, 0),
              end: const Alignment(-1, 0),
            ).animate(parentRoute!.animation!),
            child: DefaultTextStyle(
              child: title,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    fontWeight: AppTextStyle.bold,
                    color: AppColors.primary,
                  ),
            ),
          );

          return AppStatusBar(
            brightness: brightness,
            child: SizedBox.expand(
              child: Material(
                color: Color.lerp(Colors.white, Colors.white10, offset),
                child: Column(
                  children: <Widget>[
                    SizedBox.fromSize(
                      size: Size.fromHeight(minExtent),
                      child: Padding(
                        padding: EdgeInsets.only(top: paddingTop),
                        child: Row(
                          children: <Widget>[
                            if (leadingWidget != null) ...[
                              Gap(8.h),
                              leadingWidget,
                            ],
                            Gap(titleSpace),
                            Expanded(
                              child:
                                  Opacity(opacity: 1.0 - offset, child: _title),
                            ),
                            if (trailing != null) ...[
                              trailing!,
                              Gap(12.h),
                            ],
                          ],
                        ),
                      ),
                    ),
                    Flexible(
                      child: FlexibleSpaceBar.createSettings(
                        maxExtent: flexibleMaxExtent,
                        minExtent: paddingTop,
                        toolbarOpacity: offset,
                        currentExtent: currentExtent,
                        child: FlexibleSpaceBar(
                          titlePadding: EdgeInsets.only(left: 24, bottom: 8),
                          title: _title,
                          centerTitle: false,
                        ),
                      ),
                    ),
                    //if (isLoading) LoadingSpinner.linear(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _AppSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  const _AppSliverPersistentHeaderDelegate({
    required this.builder,
    double? height,
    double? minExtent,
    double? maxExtent,
    this.snapConfiguration,
    this.floating = false,
  })  : minExtent = height ?? minExtent ?? kTextTabBarHeight,
        maxExtent = height ?? maxExtent ?? kTextTabBarHeight;

  final Widget Function(BuildContext context, double shrinkOffset,
      bool overlapsContent, bool isAtTop) builder;
  @override
  final double maxExtent;
  @override
  final double minExtent;
  @override
  final FloatingHeaderSnapConfiguration? snapConfiguration;

  final bool floating;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final child =
        builder(context, shrinkOffset, overlapsContent, shrinkOffset == 0);
    return floating ? _FloatingPersistentWidget(child: child) : child;
  }

  @override
  bool shouldRebuild(_AppSliverPersistentHeaderDelegate oldDelegate) =>
      maxExtent != oldDelegate.maxExtent ||
      minExtent != oldDelegate.minExtent ||
      builder != oldDelegate.builder ||
      snapConfiguration != oldDelegate.snapConfiguration ||
      floating != oldDelegate.floating;
}

class _FloatingPersistentWidget extends StatefulWidget {
  const _FloatingPersistentWidget({Key? key, this.child}) : super(key: key);

  final Widget? child;

  @override
  _FloatingPersistentWidgetState createState() =>
      _FloatingPersistentWidgetState();
}

class _FloatingPersistentWidgetState extends State<_FloatingPersistentWidget> {
  ScrollPosition? _position;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_position != null) {
      _position!.isScrollingNotifier.removeListener(_isScrollingListener);
    }
    _position = Scrollable.of(context)?.position;
    if (_position != null) {
      _position!.isScrollingNotifier.addListener(_isScrollingListener);
    }
  }

  @override
  void dispose() {
    if (_position != null) {
      _position!.isScrollingNotifier.removeListener(_isScrollingListener);
    }
    super.dispose();
  }

  RenderSliverFloatingPersistentHeader? _headerRenderer() {
    return context
        .findAncestorRenderObjectOfType<RenderSliverFloatingPersistentHeader>();
  }

  void _isScrollingListener() {
    if (_position == null) {
      return;
    }

    // When a scroll stops, then maybe snap the appbar into view.
    // Similarly, when a scroll starts, then maybe stop the snap animation.
    final RenderSliverFloatingPersistentHeader? header = _headerRenderer();
    if (_position!.isScrollingNotifier.value) {
      header?.maybeStopSnapAnimation(_position!.userScrollDirection);
    } else {
      header?.maybeStartSnapAnimation(_position!.userScrollDirection);
    }
  }

  @override
  Widget build(BuildContext context) => widget.child!;
}
