import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoestore_mobile/core/constant/constants.dart';
import 'package:shoestore_mobile/layer/presentation/main/page/home_page.dart';

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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: colorPrimary,
        ),
        Center(
          child: Image.asset(
            'assets/images/shoestore_logo_long.png',
            width: MediaQuery.of(context).size.width * 0.7,
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
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 500),
          transitionsBuilder: (_, animation, animationTime, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut
            );

            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
          pageBuilder: (_, animation, animationTime) {
            return HomePage();
          }
        )
      );
    });
  }
}
