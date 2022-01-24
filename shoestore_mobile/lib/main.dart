import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoestore_mobile/core/constant/constants.dart';
import 'package:shoestore_mobile/core/di/injection_container.dart' as di;
import 'package:shoestore_mobile/layer/presentation/detail/notifier/detail_shoes_notifier.dart';
import 'package:shoestore_mobile/layer/presentation/main/notifier/home_notifier.dart';
import 'package:shoestore_mobile/layer/presentation/main/page/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeNotifier>(
          create: (_) => di.sl<HomeNotifier>(),
        ),
        ChangeNotifierProvider<DetailShoesNotifier>(
          create: (_) => di.sl<DetailShoesNotifier>(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'shoestore',
        theme: ThemeData(
          primarySwatch: colorPrimary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Worksans'
        ),
        home: SplashPage(),
      ),
    );
  }
}
