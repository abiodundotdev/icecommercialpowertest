import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:iconly/iconly.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  CustomAppBar({
    Key? key,
    this.titleSpacing,
    this.automaticallyImplyLeading = true,
    this.title,
    this.child,
    this.systemOverlayStyle = SystemUiOverlayStyle.dark,
    this.leading,
    this.trailing,
    this.onPop,
    this.bottom,
    this.backgroundColor,
    this.titleTextStyle,
  })  : assert((() => !(title != null && child != null))(),
            'Only either title or child can be used'),
        super(key: key);

  final double? titleSpacing;
  final bool automaticallyImplyLeading;
  final String? title;
  final Widget? child;
  final SystemUiOverlayStyle systemOverlayStyle;
  final Widget? leading;
  final Widget? trailing;
  final VoidCallback? onPop;
  final Color? backgroundColor;
  final TextStyle? titleTextStyle;
  final PreferredSize? bottom;

  @override
  Widget build(BuildContext context) {
    final ModalRoute<dynamic>? parentRoute = ModalRoute.of(context);
    final bool useCloseButton =
        parentRoute is PageRoute<dynamic> && parentRoute.fullscreenDialog;

    Widget? leadingWidget = leading;
    if (leading == null && automaticallyImplyLeading) {
      leadingWidget = useCloseButton
          ? AppCloseButton(onPressed: onPop)
          : AppBackButton(onPressed: onPop);
    }

    return AppBar(
      titleSpacing: titleSpacing ?? NavigationToolbar.kMiddleSpacing,
      automaticallyImplyLeading: automaticallyImplyLeading,
      backgroundColor: backgroundColor ?? Colors.transparent,
      leading: leadingWidget,
      centerTitle: true,
      systemOverlayStyle: systemOverlayStyle,
      title: _buildTitle(context),
      elevation: 0,
      actions: <Widget>[if (trailing != null) trailing!],
      bottom: bottom,
    );
  }

  Widget? _buildTitle(BuildContext context) {
    if (child != null) {
      return child;
    }

    if (title != null) {
      return Text(
        title!,
        style: titleTextStyle ??
            Theme.of(context).textTheme.caption!.copyWith(
                  fontSize: 20.0.sp,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
      );
    }

    return null;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class AppCloseButton extends StatelessWidget {
  const AppCloseButton({Key? key, this.color, this.onPressed})
      : super(key: key);

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: IconTheme.of(context).size!,
      icon: Icon(AppIcons.cancel),
      color: color ?? AppColors.dark,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}

class AppBackButton extends StatelessWidget {
  const AppBackButton({Key? key, this.color, this.onPressed}) : super(key: key);

  final Color? color;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: IconTheme.of(context).size!,
      icon: const Icon(
        IconlyLight.arrow_left_2,
        color: Colors.black,
      ),
      color: color ?? AppColors.dark,
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}
