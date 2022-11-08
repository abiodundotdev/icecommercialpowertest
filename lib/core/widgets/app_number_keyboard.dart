import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:icecommercialpowertest/core/core.dart';

class AppKeyPad extends StatefulWidget {
  final ValueSetter<String>? onKeyTap;
  final int maxAllowableCahracters;
  final double? height;
  const AppKeyPad({
    Key? key,
    this.onKeyTap,
    this.height,
    required this.maxAllowableCahracters,
  }) : super(key: key);
  @override
  State<AppKeyPad> createState() => _AppKeyPadState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
        .add(IntProperty('maxAllowableCahracters', maxAllowableCahracters));
    properties.add(DiagnosticsProperty<Function>('animateColor', onKeyTap));
  }
}

class _AppKeyPadState extends State<AppKeyPad> {
  final List<String> buttonTexts = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    " ",
    "0",
    "DEL"
  ];
  String value = "";
  late ValueNotifier<String> activeButtonListener;
  @override
  void initState() {
    super.initState();
    activeButtonListener = ValueNotifier<String>("");
  }

  @override
  void dispose() {
    super.dispose();
    activeButtonListener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: activeButtonListener,
        builder: (context, String val, _) {
          return Container(
            constraints: BoxConstraints.tightFor(height: widget.height),
            color: Colors.transparent,
            padding: const EdgeInsets.all(20.0),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 25.0.h,
              crossAxisSpacing: 40.0.w,
              children: [
                for (var i = 0; i < buttonTexts.length; i++)
                  LayoutBuilder(builder: (context, constraints) {
                    final buttonText = buttonTexts[i];
                    return buttonTexts[i] == "DEL"
                        ? Container(
                            color: Colors.white70,
                            constraints: constraints,
                            padding: const EdgeInsets.all(10.0),
                            child: IconButton(
                              onPressed: () {
                                if (value.isNotEmpty) {
                                  value = value.removeLastCharacter;
                                }
                                if (widget.onKeyTap != null) {
                                  widget.onKeyTap!(value);
                                }
                              },
                              icon: Icon(
                                // Icons.tag_cross,
                                Icons.ac_unit,
                                size: constraints.maxWidth / 2,
                                color: AppColors.primary,
                              ),
                            ),
                          )
                        : (buttonText == " "
                            ? const SizedBox()
                            : _Button(
                                isTapped: val == buttonText,
                                onTap: () async {
                                  activeButtonListener.value = buttonText;
                                  await Future.delayed(
                                    const Duration(
                                      milliseconds: 100,
                                    ),
                                  );
                                  activeButtonListener.value = "";
                                  if (value.length <
                                      widget.maxAllowableCahracters) {
                                    value += buttonText;
                                  }
                                  if (widget.onKeyTap != null) {
                                    widget.onKeyTap!(value);
                                  }
                                },
                                constraints: constraints,
                                text: buttonText,
                              ));
                  }),
              ],
            ),
          );
        });
  }
}

class _Button extends StatelessWidget {
  _Button({
    Key? key,
    required this.constraints,
    required this.text,
    required this.isTapped,
    required this.onTap,
  }) : super(key: key);
  final BoxConstraints constraints;
  final String text;
  bool isTapped;
  VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      customBorder: const CircleBorder(),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        child: Container(
          key: ValueKey(text),
          decoration: ShapeDecoration(
            color: isTapped ? AppColors.primary : Colors.grey[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.w),
              side: const BorderSide(
                color: Colors.white,
                // color: AppColors.primary,
              ),
            ),
            shadows: const [
              BoxShadow(
                color: Color(0xFFBEBEBE),
                // Shadow for bottom right corner
                offset: Offset(5, 5),
                blurRadius: 20,
                spreadRadius: 1,
              ),
              BoxShadow(
                color: Colors.white,
                // Shadow for top left corner
                offset: Offset(-5, -5),
                blurRadius: 20,
                spreadRadius: 1,
              ),
            ],
          ),
          constraints: constraints.tighten(
            width: constraints.maxWidth,
            height: constraints.maxHeight,
          ),
          child: Center(
            child: Text(
              text,
              style: AppFont.bold(
                size: 24.0.sp,
                color: isTapped ? AppColors.white : AppColors.primary,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
