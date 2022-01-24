import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:shoestore_mobile/core/constant/constants.dart';
import 'package:shoestore_mobile/core/util/currency_converter.dart';
import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_colorway.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_image.dart';
import 'package:shoestore_mobile/layer/presentation/detail/notifier/detail_shoes_notifier.dart';
import 'package:shoestore_mobile/layer/presentation/main/notifier/home_notifier.dart';

class DetailShoesPage extends StatefulWidget {
  final String id;

  const DetailShoesPage({Key key, this.id}) : super(key: key);

  @override
  _DetailShoesPageState createState() => _DetailShoesPageState();
}

class _DetailShoesPageState extends State<DetailShoesPage> {

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      context.read<DetailShoesNotifier>().getShoes(
        id: widget.id
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final shoes = context.select((DetailShoesNotifier n) => n.shoes);
    final isLoading = context.select((DetailShoesNotifier n) => n.isLoadingShoes);
    final selectedColorway = context.select((DetailShoesNotifier n) => n.selectedColorway);

    final exchange = context.select((HomeNotifier n) => n.exchange);

    log(json.encode(exchange));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: _buildBody(
                      shoes: shoes,
                      isLoading: isLoading,
                      selectedColorway: selectedColorway,

                      exchange: exchange
                    ),
                  ),
                  Positioned(
                    left: 0,
                    top: 0,
                    right: 0,
                    child: _buildAppBar()
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          icon: Padding(
            padding: EdgeInsets.all(4.0),
            child: Image.asset(
              "assets/images/icon_search.png",
              fit: BoxFit.cover,
              color: Colors.white,
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
              color: Colors.white,
            ),
          ),
          onPressed: () {}
        ),
      ],
    );
  }

  Widget _buildBody({Shoes shoes, bool isLoading, int selectedColorway, Exchange exchange}) {
    if (isLoading) {
      return Shimmer.fromColors(
        baseColor: Colors.grey[200],
        highlightColor: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImages(),

            SizedBox(height: 12),
            _buildTitle(),
            SizedBox(height: 4),
            _buildSubtitle(),

            SizedBox(height: 8),
            _buildPrice(),

            SizedBox(height: 20),
            _buildColorways(),
          ],
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildImages(
          images: shoes.colorways.isEmpty
            ? shoes.images
            : shoes.colorways[selectedColorway].images
        ),

        SizedBox(height: 12),
        _buildTitle(title: shoes.title),
        SizedBox(height: 4),
        _buildSubtitle(subtitle: shoes.subtitle),

        SizedBox(height: 8),
        _buildPrice(
          stringPrice: shoes.price,
          exchange: exchange
        ),

        SizedBox(height: 20),
        if (shoes.colorways.isNotEmpty) _buildColorways(
          colorways: shoes.colorways,
          selected: selectedColorway
        ),
      ],
    );
  }

  Widget _buildImages({List<ShoesImage> images}) {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(20),
      ),
      child: AspectRatio(
        aspectRatio: 1,
        child: Swiper(
          physics: BouncingScrollPhysics(),
          itemCount: images == null ? 3 : images.length,
          itemBuilder: (_, index) {
            return images == null
            ? Image.asset(
              "assets/images/dummy_shoes.png",
              fit: BoxFit.cover,
            )
            : Image.network(
              baseUrl + images[index].image,
              fit: BoxFit.cover,
            );
          },
          autoplay: false,
          loop: false,
          pagination: SwiperPagination(
            alignment: Alignment.bottomCenter,
            builder: SwiperPagination.dots
          )
        ),
      ),
    );
  }

  Widget _buildTitle({String title}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        title ?? "",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buildSubtitle({String subtitle}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        subtitle ?? "",
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildPrice({String stringPrice, Exchange exchange}) {
    int price;

    if (stringPrice != null && exchange != null) {
      if (exchange.rates != null && exchange.rates.isNotEmpty){
        int euro = int.parse(stringPrice) ~/ exchange.rates[0].rate;
        price = (euro * exchange.rates[1].rate).toInt();
      }

      else price = int.parse(stringPrice);
    }

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        price == null ? "" : CurrencyConverter.currency(price),
        style: TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildColorways({List<ShoesColorway> colorways, int selected}) {
    if (colorways == null) colorways = List(6);

    return Container(
      height: 64,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: colorways.length,
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      if (selected != index)
                        context.read<DetailShoesNotifier>().setSelectedColorway(index);
                    },
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Card(
                        elevation: 0,
                        margin: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          side: BorderSide(
                            color: selected == index ? colorPrimary : Colors.transparent,
                            width: 2
                          )
                        ),
                        child: colorways[index] == null || colorways[index].images == null || colorways[index].images.isEmpty
                          ? Image.asset(
                            "assets/images/dummy_shoes.png",
                            fit: BoxFit.cover,
                            width: 64,
                          )
                          : Image.network(
                            baseUrl + colorways[index].images[0].image,
                            fit: BoxFit.cover,
                            width: 64,
                          ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, index) {
                  return SizedBox(width: 8);
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
