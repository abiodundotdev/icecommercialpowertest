import 'package:flutter/widgets.dart';

abstract class DismissKeyboardMixin {
  BuildContext get context;

  void closeKeyboard() => closeKeyboardAction(context);
}

void closeKeyboardAction(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
