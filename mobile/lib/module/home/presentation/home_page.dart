import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/common/utils/currency_formatter.dart';
import 'package:mobile/common/utils/extensions.dart';
import 'package:mobile/module/home/presentation/notifier/home_notifier.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../../../common/config/theme.dart';
import '../../../common/constant/api_path_constants.dart';
import '../domain/entities/get_shoes_entity.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        context.read<HomeNotifier>().getShoes();
      }
    });
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<HomeNotifier>().getShoes();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<ShoesEntity> listShoes =
    context.select((HomeNotifier n) => n.listShoes);
    bool isLoadingShoes = context.select((HomeNotifier n) => n.isLoadingShoes);
    bool isKeepLoadingShoes = context.select((HomeNotifier n) =>
    n.isKeepLoadingShoes);

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
          if (isLoadingShoes && listShoes.isEmpty) {
            return WaterfallFlow.builder(
              gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: 12,
              itemBuilder: (_, index) =>
                  Shimmer.fromColors(
                    highlightColor: Colors.grey.shade300,
                    baseColor: Colors.grey.shade200,
                    child: Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Column(
                        children: [
                          AspectRatio(
                            aspectRatio: 1,
                            child: Container(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.asset(
                                  'assets/images/shoestore_no_image.png',
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Container(
                            width: double.infinity,
                            height: 28.0,
                            decoration: BoxDecoration(
                              color: ColorsTheme.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          SizedBox(height: 12.0),
                          Container(
                            width: double.infinity,
                            height: 20.0,
                            decoration: BoxDecoration(
                              color: ColorsTheme.white,
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
            );
          } else if (!isLoadingShoes && listShoes.isEmpty) {
            return Center(child: Text('empty'));
          }

          return SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                WaterfallFlow.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: listShoes.length,
                  itemBuilder: (_, index) =>
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AspectRatio(
                              aspectRatio: 1,
                              child: Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: listShoes[index].image == null
                                  ? Image.asset(
                                    'assets/images/shoestore_no_image.png',
                                    fit: BoxFit.cover,
                                  )
                                  : CachedNetworkImage(
                                    imageUrl: '${ApiPathConstants.baseUrl}'
                                        '${listShoes[index].image}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12.0),
                            SizedBox(
                              height: 40.0,
                              child: Text(
                                listShoes[index].title ?? '',
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline5,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            SizedBox(
                              height: 20.0,
                              child: Text(
                                CurrencyFormatter.formatNumber(
                                    double.parse(
                                        listShoes[index].price ?? '0')),
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline5,
                              ),
                            ),
                          ],
                        ),
                      ),
                ),
                if (isKeepLoadingShoes) Padding(
                  padding: EdgeInsets.all(12.0),
                  child: CircularProgressIndicator(
                    color: ColorsTheme.primary,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
