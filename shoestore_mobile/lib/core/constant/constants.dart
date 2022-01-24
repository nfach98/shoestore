import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String baseApiUrl = 'http://shoestore.propose.my.id/api';
String baseUrl = 'http://shoestore.propose.my.id/';

Map<int, Color> colorPrimaryMap = {
  50: Color.fromRGBO(9, 45, 109, .1),
  100: Color.fromRGBO(9, 45, 109, .2),
  200: Color.fromRGBO(9, 45, 109, .3),
  300: Color.fromRGBO(9, 45, 109, .4),
  400: Color.fromRGBO(9, 45, 109, .5),
  500: Color.fromRGBO(9, 45, 109, .6),
  600: Color.fromRGBO(9, 45, 109, .7),
  700: Color.fromRGBO(9, 45, 109, .8),
  800: Color.fromRGBO(9, 45, 109, .9),
  900: Color.fromRGBO(9, 45, 109, 1),
};

var colorPrimary = MaterialColor(0xFF092D6D, colorPrimaryMap);

var currencyFormat = NumberFormat.currency(
  locale: Platform.localeName,
  decimalDigits: 0
);