import 'dart:io';

import 'package:intl/intl.dart';

class Money {
  String amount;
  Money(this.amount);
  String get formatted {
    var symbol =
        NumberFormat.simpleCurrency(locale: Platform.localeName, name: 'USD')
            .currencySymbol;
    var currencyConverter =
        NumberFormat('#,##0.00', 'en_US').format(double.parse(amount));
    return '$symbol $currencyConverter';
  }
}
