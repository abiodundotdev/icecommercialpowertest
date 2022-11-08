import 'package:icecommercialpowertest/core/exceptions.dart';
import 'package:icecommercialpowertest/core/utils/app_validator.dart';

typedef ValidatorX = String? Function(String?)?;

extension FormValidatorString on String {
  ValidatorX validate({
    String? label,
    Map<String, String>? messages,
  }) {
    if (isEmpty) {
      throw ValidatorException("You cannot validate an empty string");
    }
    return AppValidator.validate(split("|"), label, messages);
  }
}

extension FormValidatorList on List<String> {
  ValidatorX validate({
    String? label,
    Map<String, String>? messages,
  }) {
    if (isEmpty) {
      throw ValidatorException("You cannot validate an empty list");
    }
    return AppValidator.validate(this, label, messages);
  }
}
