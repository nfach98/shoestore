import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobile/routes.dart';
import 'common/constant/route_constants.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shoestore',
      initialRoute: RouteConstants.splash,
      onGenerateInitialRoutes: (String initialRouteName) {
        return [
          AppRouter().onGenerateRoute(RouteSettings(name: initialRouteName)),
        ];
      },
      onGenerateRoute: AppRouter().onGenerateRoute,
    );
  }
}
