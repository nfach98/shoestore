import 'package:flutter/material.dart';
import 'package:mobile/module/detail/presentation/arguments/detail_page_arguments.dart';
import 'package:mobile/module/home/presentation/home_page.dart';
import 'package:mobile/module/splash/presentation/splash_page.dart';

import 'common/constant/route_constants.dart';
import 'module/detail/presentation/detail_page.dart';
class AppRouter {
  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RouteConstants.splash:
        return MaterialPageRoute(builder: (_) => SplashPage());
      case RouteConstants.home:
        return MaterialPageRoute(builder: (_) => HomePage());
      case RouteConstants.detail:
        return MaterialPageRoute(builder: (_) => DetailPage(
          arguments: routeSettings.arguments as DetailPageArguments,
        ));
      default:
        return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => Center(child: Text("Route not found")),
        );
    }
  }
}
