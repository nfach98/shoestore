import 'package:intl/intl.dart';

class CurrencyFormatter {
  CurrencyFormatter._();

  static String formatNumber(num value) {
    return NumberFormat.currency(locale: 'id', symbol: 'Rp ')
      .format(value)
      .replaceAll(RegExp(r',00'), '');
  }
}