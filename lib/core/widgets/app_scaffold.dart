import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecommercialpowertest/core/core.dart';

enum AppFloatingActionButtonLocation { center, top, bottom }
enum _LayoutSlot { body, appBar, bottom, background, fab }

class AppScaffold extends StatefulWidget {
  const AppScaffold({
    Key? key,
    required this.body,
    this.backgroundColor,
    this.appBar,
    this.padding,
    this.bottom,
    this.floatingActionButtonLocation = AppFloatingActionButtonLocation.center,
    this.fab,
  }) : super(key: key);

  final PreferredSizeWidget? appBar;
  final Widget body;
  final Color? backgroundColor;
  final AppFloatingActionButtonLocation floatingActionButtonLocation;
  final EdgeInsets? padding;
  final PreferredSizeWidget? bottom;
  final PreferredSizeWidget? fab;
  @override
  AppScaffoldState createState() => AppScaffoldState();
}

class AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    final fabLocation = widget.floatingActionButtonLocation;
    final queryData = MediaQuery.of(context);
    final systemPadding = queryData.padding;
    final appBarHeight = widget.appBar != null
        ? widget.appBar!.preferredSize.height + systemPadding.top
        : 0.0;

    return Material(
      child: CustomMultiChildLayout(
        delegate: _AppScaffoldDelegate(
          mediaQueryData: MediaQuery.of(context),
          viewInsets: queryData.viewInsets,
          bottomHeight: (widget.bottom?.preferredSize.height ?? 0) +
              queryData.padding.bottom,
          bottomSize: widget.bottom?.preferredSize,
          fabSize: widget.fab?.preferredSize,
          fabLocation: widget.floatingActionButtonLocation,
        ),
        children: <Widget>[
          LayoutId(
            id: _LayoutSlot.background,
            child: Material(
              color: widget.backgroundColor ??
                  const Color.fromARGB(255, 246, 246, 246),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
          LayoutId(
            id: _LayoutSlot.body,
            child: Material(
              type: MaterialType.transparency,
              child: MediaQuery(
                data: queryData.removePadding(removeTop: widget.appBar != null),
                child: Padding(
                  padding: widget.padding ??
                      EdgeInsets.fromLTRB(20, 0, 20, systemPadding.bottom),
                  child: widget.body,
                ),
              ),
            ),
          ),
          if (widget.appBar != null)
            LayoutId(
              id: _LayoutSlot.appBar,
              child: ConstrainedBox(
                constraints: BoxConstraints(maxHeight: appBarHeight),
                child: FlexibleSpaceBar.createSettings(
                  currentExtent: appBarHeight,
                  child: MediaQuery(
                    data: queryData.removePadding(removeBottom: true),
                    child: widget.appBar!,
                  ),
                ),
              ),
            ),
          if (widget.bottom != null)
            LayoutId(
              id: _LayoutSlot.bottom,
              child: Material(
                elevation: 10.0,
                color: Colors.transparent,
                type: MaterialType.canvas,
                shadowColor: Colors.grey.shade400,
                child: MediaQuery(
                  child: widget.bottom!,
                  data: queryData
                      .removePadding(removeBottom: true)
                      .removeViewInsets(removeBottom: true),
                ),
              ),
            ),
          if (widget.fab != null)
            LayoutId(
              id: _LayoutSlot.fab,
              child: Material(
                type: MaterialType.canvas,
                color: Colors.transparent,
                child: MediaQuery(
                  child: widget.fab!,
                  data: queryData.removePadding(removeBottom: true),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _AppScaffoldDelegate extends MultiChildLayoutDelegate {
  _AppScaffoldDelegate(
      {this.viewInsets,
      this.bottomHeight,
      this.bottomSize,
      this.fabSize,
      required this.fabLocation,
      required this.mediaQueryData});
  final double? bottomHeight;
  final EdgeInsets? viewInsets;
  final Size? bottomSize;
  final Size? fabSize;
  final AppFloatingActionButtonLocation fabLocation;
  final MediaQueryData mediaQueryData;

  @override
  void performLayout(Size size) {
    final looseConstraints = BoxConstraints.loose(size);
    final fullWidthConstraints = looseConstraints.tighten(width: size.width);

    double appBarHeight = 0.0;

    if (hasChild(_LayoutSlot.appBar)) {
      appBarHeight =
          layoutChild(_LayoutSlot.appBar, fullWidthConstraints).height;
      positionChild(_LayoutSlot.appBar, Offset.zero);
    }

    final bodyConstraints = fullWidthConstraints.copyWith(
      maxHeight:
          fullWidthConstraints.maxHeight - appBarHeight - viewInsets!.bottom,
    );
    layoutChild(_LayoutSlot.body, bodyConstraints);
    positionChild(_LayoutSlot.body, Offset(0, appBarHeight));

    final backgroundConstraints = fullWidthConstraints.copyWith(
      maxHeight: fullWidthConstraints.maxHeight,
    );
    layoutChild(_LayoutSlot.background, backgroundConstraints);
    positionChild(_LayoutSlot.background, Offset.zero);

    if (hasChild(_LayoutSlot.bottom)) {
      layoutChild(_LayoutSlot.bottom,
              BoxConstraints.tight(Size(size.width, bottomHeight ?? 0)))
          .height;
      positionChild(
        _LayoutSlot.bottom,
        Offset(0, looseConstraints.maxHeight - (bottomHeight ?? 0)),
      );
    }
    if (hasChild(_LayoutSlot.fab)) {
      layoutChild(
          _LayoutSlot.fab, BoxConstraints.tight(Size.square(fabSize!.width)));
      positionChild(
        _LayoutSlot.fab,
        Offset(
          fabLocation == AppFloatingActionButtonLocation.center
              ? ((mediaQueryData.size.width - 50) / 2)
              : mediaQueryData.size.width - ((fabSize?.width ?? 0) + 20.w),
          (looseConstraints.maxHeight -
              ((bottomHeight! == 0 ? 80.0.h : bottomHeight!) * 1.5)),
        ),
      );
    }
  }

  @override
  bool shouldRelayout(_AppScaffoldDelegate oldDelegate) =>
      viewInsets != oldDelegate.viewInsets ||
      bottomHeight != oldDelegate.bottomHeight;
}
