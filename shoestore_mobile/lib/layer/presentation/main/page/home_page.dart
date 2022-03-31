import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoestore_mobile/core/constant/constants.dart';
import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/presentation/detail/page/detail_shoes_page.dart';
import 'package:shoestore_mobile/layer/presentation/main/notifier/home_notifier.dart';
import 'package:shoestore_mobile/layer/presentation/main/widget/item_shoes.dart';
import 'package:waterfall_flow/waterfall_flow.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      context.read<HomeNotifier>().getAllShoes();

      if(currencyFormat.currencySymbol != 'IDR')
        context.read<HomeNotifier>().getExchange(
          symbol1: 'IDR',
          symbol2: currencyFormat.currencySymbol
        );
    });

    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels == scrollController.position.maxScrollExtent) {
        context.read<HomeNotifier>().getAllShoes();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final shoes = context.select((HomeNotifier n) => n.shoes);
    final isLoading = context.select((HomeNotifier n) => n.isLoadingShoes);
    final isKeepLoading = context.select((HomeNotifier n) => n.isKeepLoadingShoes);

    final exchange = context.select((HomeNotifier n) => n.exchange);

    return Scaffold(
      appBar: _buildAppBar(),
      backgroundColor: Colors.white,
      body: _buildList(
        shoes: shoes,
        isLoading: isLoading,
        isKeepLoading: isKeepLoading,

        exchange: exchange
      ),
    );
  }

  _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Image.asset(
        "assets/images/shoestore_logo_long.png",
        width: 160,
        fit: BoxFit.cover,
        color: colorPrimary,
      ),
      actions: [
        IconButton(
          icon: Padding(
            padding: EdgeInsets.all(4.0),
            child: Image.asset(
              "assets/images/icon_search.png",
              fit: BoxFit.cover,
              color: colorPrimary,
            ),
          ),
          onPressed: () {}
        ),
        IconButton(
          icon: Padding(
            padding: EdgeInsets.all(4.0),
            child: Image.asset(
              "assets/images/icon_cart.png",
              fit: BoxFit.cover,
              color: colorPrimary,
            ),
          ),
          onPressed: () {}
        ),
      ],
    );
  }

  Widget _buildList({List<Shoes?>? shoes, Exchange? exchange, required bool isLoading, required bool isKeepLoading}) {
    if ((isLoading && shoes!.isEmpty) || shoes == null) {
      shoes = List.generate(12, (index) => null);
    }

    return SingleChildScrollView(
      controller: scrollController,
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: WaterfallFlow.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.0,
                mainAxisSpacing: 12.0,
              ),
              itemCount: shoes.length,
              itemBuilder: (_, index) {
                return shoes?[index] == null
                  ? Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.white,
                    child: ItemShoes()
                  )
                  : ItemShoes(
                    shoes: shoes![index]!,
                    exchangeRates: exchange != null ? exchange.rates : null,
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => DetailShoesPage(
                        id: shoes?[index]?.id ?? '',
                      ))
                    ),
                  );
              }
            ),
          ),
          if (isKeepLoading)
            Container(
              child: CircularProgressIndicator(),
            ),
          SizedBox(height: 12),
        ],
      ),
    );
  }
}