import 'package:shoestore_mobile/core/constant/constants.dart';

class CurrencyConverter {
  static String currency(dynamic number) {
    return currencyFormat.format(number);
  }
}