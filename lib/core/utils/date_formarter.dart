import 'package:intl/intl.dart';

class AppDateFormater {
  DateTime date;

  AppDateFormater(this.date);
  static String fromString(String date) {
    final dateFormat = DateFormat("EEE d, MMM yyyy");
    return dateFormat.format(DateTime.parse(date));
  }

  String get formatted {
    final dateFormat = DateFormat("EEE d, MMM yyyy");
    return dateFormat.format(date);
  }

  String get yyyymmdd {
    final dateFormat = DateFormat("yyyy-MM-dd");
    return dateFormat.format(date);
  }
}
