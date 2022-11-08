import 'package:flutter/material.dart';
import 'package:icecommercialpowertest/core/core.dart';
import 'package:icecommercialpowertest/core/widgets/dialogue_wrapper.dart';

List<OverlayEntry> _entryList = [];

class AppPreloader {
  static show(BuildContext context, {bool isDissmissible = true}) {
    final entry = _buildEntry(context, isDismissible: isDissmissible);
    _entryList.add(entry);
    rootNavigatorKey.currentState?.overlay!.insert(entry);
  }

  static hide(BuildContext context) {
    if (_entryList.isNotEmpty) _entryList.last.remove();
  }
}

OverlayEntry _buildEntry(BuildContext context, {bool isDismissible = true}) {
  return OverlayEntry(
    builder: (BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          if (isDismissible) {
            AppPreloader.hide(context);
            return isDismissible;
          }
          return isDismissible;
        },
        child: GestureDetector(
          onTapUp: (_) {
            if (isDismissible) AppPreloader.hide(context);
          },
          child: const CustomPreloader(),
        ),
      );
    },
  );
}



// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return const Center(
//       child: CustomPreloader(),
//     );
//   },
// );
