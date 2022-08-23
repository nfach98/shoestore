import 'package:flutter/material.dart';
import 'package:mobile/common/config/theme.dart';
import 'package:mobile/module/detail/presentation/notifier/detail_notifier.dart';
import 'package:mobile/module/home/presentation/notifier/home_notifier.dart';
import 'package:mobile/routes.dart';
import 'package:provider/provider.dart';
import 'common/constant/route_constants.dart';
import 'injection_container.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeNotifier>(
          create: (_) => sl<HomeNotifier>(),
        ),
        ChangeNotifierProvider<DetailNotifier>(
          create: (_) => sl<DetailNotifier>(),
        ),
      ],
      child: MaterialApp(
        title: 'shoestore',
        initialRoute: RouteConstants.splash,
        theme: AppTheme.theme,
        onGenerateInitialRoutes: (String initialRouteName) {
          return [
            AppRouter().onGenerateRoute(RouteSettings(name: initialRouteName)),
          ];
        },
        onGenerateRoute: AppRouter().onGenerateRoute,
      ),
    );
  }
}
