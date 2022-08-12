import 'package:flutter/material.dart';
import 'package:mobile/module/home/presentation/home_page.dart';
import 'package:mobile/module/splash/presentation/splash_page.dart';

import 'common/constant/route_constants.dart';
class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteConstants.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => Center(child: Text("Something wrong")),
        );
    }
  }
}
