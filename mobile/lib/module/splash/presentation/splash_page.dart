import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile/common/constant/route_constants.dart';
import 'package:mobile/common/utils/extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _startSplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: context.screenWidth,
          height: context.screenHeight,
          color: Colors.black,
        ),
        Center(
          child: Image.asset(
            'assets/images/shoestore_logo_long.png',
            width: context.screenWidth * 0.7,
            fit: BoxFit.cover,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  _startSplashScreen() {
    var duration = const Duration(milliseconds: 3000);
    return Timer(duration, () {
      Navigator.pushReplacementNamed(context, RouteConstants.home);
    });
  }
}