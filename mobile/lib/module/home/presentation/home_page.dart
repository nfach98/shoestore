import 'package:flutter/material.dart';
import 'package:mobile/common/utils/extensions.dart';
import 'package:mobile/module/home/presentation/notifier/home_notifier.dart';
import 'package:provider/provider.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../../../common/config/theme.dart';
import '../domain/entities/get_shoes_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<HomeNotifier>().getShoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ShoesEntity> listShoes =
        context.select((HomeNotifier n) => n.listShoes);

    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/shoestore_logo_long.png',
          width: context.screenWidth * .4,
          fit: BoxFit.cover,
          color: ColorsTheme.primary,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/images/icon_search.png',
                fit: BoxFit.cover,
                color: ColorsTheme.primary,
              ),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset(
                'assets/images/icon_cart.png',
                fit: BoxFit.cover,
                color: ColorsTheme.primary,
              ),
            ),
          )
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraint) {
          return WaterfallFlow.builder(
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
            itemCount: 12,
            itemBuilder: (_, index) => Column(
              children: [
                AspectRatio(
                  aspectRatio: 1,
                  child: Container(
                    padding: EdgeInsets.all(12.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12.0),
                      child: Image.asset(
                        'assets/images/shoestore_no_image.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 8.0)
              ],
            ),
          );
        },
      ),
    );
  }
}
