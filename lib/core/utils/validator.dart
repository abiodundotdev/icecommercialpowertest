import 'dart:io';

import 'package:flutter/widgets.dart';

typedef ValidatorFn<T, U> = U Function(T value);

class Validators {
  static ValidatorFn<String?, String?> tryAlpha(
      {String? error, String label = "Field"}) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return error ?? '$label is required.';
      }
      final RegExp nameExp = RegExp(r'^[A-Za-z ]+$');
      if (!nameExp.hasMatch(value)) {
        return error ?? 'Please enter only alphabetical characters.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryDouble(
      {String? error, String label = "Field"}) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return error ?? '$label is required.';
      }
      if ((double.tryParse(value) ?? 0.0) <= 0.0) {
        return error ?? 'Not a valid number.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryInt(
      {String? error, String label = "Field"}) {
    return (String? value) {
      if (value == null || value.isEmpty) {
        return error ?? '$label is required.';
      }
      if ((int.tryParse(value) ?? 0.0) <= 0) {
        return error ?? 'Not a valid number.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryEmail(
      {String? error, String label = "Email"}) {
    return (String? value) {
      if (value!.isEmpty) {
        return error ?? '$label is required.';
      }
      if (!value.contains('@')) {
        return error ?? 'Not a valid email.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryPhone(
      {String? error, String label = "Phone number"}) {
    return (String? value) {
      if (value!.isEmpty) {
        return error ?? '$label is required.';
      }
      if (!RegExp(r'^\d+?$').hasMatch(value) ||
          !value.startsWith(RegExp("0[1789]")) ||
          // Land lines eg 01
          (value.startsWith("01") && value.length != 9) ||
          // Land lines eg 080
          (value.startsWith(RegExp("0[789]")) && value.length != 11)) {
        return error ?? 'Not a valid phone number.';
      }
      return null;
    };
  }

  static ValidatorFn<List<dynamic>?, String?> tryList(
      {String? error, String label = "Field"}) {
    return (List<dynamic>? value) {
      if (value == null || value.isEmpty) {
        return error ?? '$label is required.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryPassword([String? error]) {
    return (String? value) {
      if (value == null || value.isEmpty || value.trim().isEmpty) {
        return error ?? 'Password field is required.';
      }
      if (!value.contains(RegExp(r'^.*(?=.{8,})(?=.*[a-zA-Z0-9]).*$'))) {
        return 'At least 8 characters.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryLength(
      {int min = 1, int max = 99, String label = "Field", String? error}) {
    return (String? value) {
      if (value == null || (min == max) && value.length != max) {
        return error ?? '$label should be $max characters.';
      }
      if (value == null || value.isEmpty || value.trim().isEmpty) {
        return error ?? '$label is required.';
      }
      if (value.length < min || value.length > max) {
        return error ??
            '$label should be less than $max characters and greater than $min characters.';
      }

      return null;
    };
  }

  static ValidatorFn<String?, String?> tryString(
      {String? error, String label = "Field"}) {
    return (String? value) {
      if (value == null || value.isEmpty || value.trim().isEmpty) {
        return error ?? '$label is required.';
      }
      return null;
    };
  }

  static ValidatorFn<File, String?> tryFile([String? error]) {
    return (File? file) {
      if (file == null || file.path.isEmpty) {
        return error ?? 'Invalid File.';
      }
      return null;
    };
  }

  static String? tryNumberAmount(double? value, [String? error]) {
    if (value == null) {
      return error ?? 'Invalid Amount.';
    }
    if (value <= 0.0) {
      return error ?? 'Zero Amount is not allowed.';
    }
    return null;
  }

  static ValidatorFn<DateTime?, String?> tryDate(
      {String? error, DateTime? min, DateTime? max}) {
    return (DateTime? value) {
      if (value == null) {
        return error ?? 'Invalid Date.';
      }
      if (max != null && value.isBefore(max)) {
        return error ?? 'The selected date has to be after $max';
      }
      if (min != null && value.isAfter(min)) {
        return error ?? 'The selected date has to be before $min';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryAmount([String? error]) {
    return (String? value) {
      if (value!.isEmpty) {
        return error ?? 'Amount is required.';
      }
      if (double.tryParse(value) == null) {
        return error ?? 'Invalid Amount.';
      }
      if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(value)) {
        return error ?? 'Not a valid amount.';
      }
      if (double.tryParse(value)! <= 0.0) {
        return error ?? 'Zero Amount is not allowed.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryFormattedAmount([String? error]) {
    return (String? value) {
      final val = value?.replaceAll("₦", "").replaceAll(",", "");
      if (val!.isEmpty) {
        return error ?? 'Amount is required.';
      }
      if (double.tryParse(val) == null) {
        return error ?? 'Invalid Amount.';
      }
      if (!RegExp(r'^\d+(\.\d{1,2})?$').hasMatch(val)) {
        return error ?? 'Not a valid amount.';
      }
      if (double.tryParse(val)! <= 0.0) {
        return error ?? 'Zero Amount is not allowed.';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryDiff(
    FormFieldState<String>? field, [
    String? error,
  ]) {
    return (String? value) {
      if (field?.value != value) {
        return error ?? 'Values don\'t match';
      }
      return null;
    };
  }

  static ValidatorFn<String?, String?> tryDiffPassword(
    FormFieldState<String>? passwordField, [
    String? error,
  ]) {
    return (String? value) {
      if (passwordField == null) {
        return 'Please enter a password.';
      }
      if (passwordField.value == null || passwordField.value!.isEmpty) {
        return 'Please enter a password.';
      }
      return tryDiff(
        passwordField,
        error ?? 'The passwords don\'t match',
      )(value);
    };
  }
}
