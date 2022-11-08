extension StringX on String {
  String get removeLastCharacter => substring(0, length - 1);
  String get capitalize {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String? get trimAndConverToGHnumber {
    if (isEmpty) {
      return "";
    }
    final trimmedString = trim().replaceAll(" ", "").replaceAll("-", "");
    if (trimmedString.length == 10) {
      return trimmedString.replaceFirst(RegExp(r'0'), "");
    }
    if (trimmedString.startsWith("233")) {
      return trimmedString.substring(3, trimmedString.length);
    }
    if (trimmedString.startsWith("+233")) {
      return trimmedString.substring(4, trimmedString.length);
    }
    return trimmedString.substring(0, 9);
  }
}
