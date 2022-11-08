import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:icecommercialpowertest/core/core.dart';

class DialogWrapper extends StatelessWidget {
  const DialogWrapper({
    Key? key,
    required this.title,
    required this.child,
    this.alignment,
    this.fillWidth = false,
    this.isDismissible = true,
    this.showTitle = true,
  }) : super(key: key);

  final String title;
  final Widget child;
  final Alignment? alignment;
  final bool fillWidth;
  final bool isDismissible;
  final bool showTitle;

  @override
  Widget build(BuildContext context) {
    final theme = ThemeProvider.of(context)!;

    return WillPopScope(
      onWillPop: () => Future.value(isDismissible),
      child: Align(
        alignment: alignment ?? Alignment.topCenter,
        child: Padding(
          padding: EdgeInsets.only(
            top: kToolbarHeight,
            bottom: MediaQuery.of(context).viewInsets.bottom + 16,
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth:
                  MediaQuery.of(context).size.width * (fillWidth ? .95 : .9),
              maxHeight: 600.h,
            ),
            child: Material(
              borderRadius: BorderRadius.circular(12),
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 4.0.h),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    if (showTitle) ...[
                      Stack(
                        children: <Widget>[
                          SizedBox(
                            height: kToolbarHeight,
                            child: Center(
                              child: Text(
                                title,
                                style: const AppFont.bold(color: Colors.black),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            left: null,
                            child: isDismissible
                                ? const AppCloseButton()
                                : const SizedBox(),
                          ),
                        ],
                      ),
                      const Gap(32),
                    ],
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 12.h),
                      child: child,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
