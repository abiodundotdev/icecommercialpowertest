import 'package:icecommercialpowertest/core/exceptions.dart';
import 'package:icecommercialpowertest/core/extensions/extensions.dart';

class AppValidator {
  static ValidatorX validate(
      List<String> rules, String? label, Map<String, String>? messages) {
    String? message;
    Map<String, String> acceptedRules = {
      'required': "${label ?? "Field"} is required",
      'max': 'Please use a valid length',
      'string': "${label ?? "Field"} must be a string",
      'int': "${label ?? "Field"} must be an integer",
      'min:': 'Please use a valid length',
      'email': 'Invalid email address'
    };
    return (String? value) {
      for (var i = 0; i < rules.length; i++) {
        final eachRule = rules[i];
        if (!acceptedRules.containsKey(eachRule)) {
          throw ValidatorException("Not a valid rule");
        }
        if (value!.isEmpty && eachRule == 'required') {
          message = acceptedRules[eachRule];
          break;
        }
        if (!value.contains('@') && eachRule == 'email') {
          message = 'Not a valid email.';
          break;
        }
      }
      return message;
    };
  }
}
