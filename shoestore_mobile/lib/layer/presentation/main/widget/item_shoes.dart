import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shoestore_mobile/core/constant/constants.dart';
import 'package:shoestore_mobile/core/util/currency_converter.dart';
import 'package:shoestore_mobile/layer/domain/entity/exchange.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes.dart';
import 'package:shoestore_mobile/layer/domain/entity/shoes_colorway.dart';

class ItemShoes extends StatefulWidget {
  final Shoes shoes;
  final List<ExchangeRate> exchangeRates;
  final Function onPressed;

  const ItemShoes({Key key, this.shoes, this.exchangeRates, this.onPressed}) : super(key: key);

  @override
  _ItemShoesState createState() => _ItemShoesState();
}

class _ItemShoesState extends State<ItemShoes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPressed == null ? () { } : widget.onPressed,
      child: Container(
        height: 320,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(),
            _buildInfo()
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: widget.shoes == null || widget.shoes.image == null
        ? ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Image.asset(
            'assets/images/shoestore_no_image.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        )
        : ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: CachedNetworkImage(
            imageUrl: baseUrl + widget.shoes.image,
            placeholder: (_, value) => Image.asset(
              'assets/images/shoestore_no_image.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        )
    );
  }

  Widget _buildInfo() {
    int price;
    if (widget.shoes != null) {
      if (widget.exchangeRates != null && widget.exchangeRates.isNotEmpty){
        int euro = int.parse(widget.shoes.price) ~/ widget.exchangeRates[0].rate;
        price = (euro * widget.exchangeRates[1].rate).toInt();
      }

      else price = int.parse(widget.shoes.price);
    }

    return Container(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.shoes == null ? "" : widget.shoes.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(height: 4),
          Text(
            widget.shoes == null ? "" : widget.shoes.subtitle,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12
            ),
          ),

          if(widget.shoes != null && widget.shoes.colorways.isNotEmpty)
            _buildColorways(colorways: widget.shoes.colorways),

          SizedBox(height: 12),
          Text(
            price == null ? "" : CurrencyConverter.currency(price),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildColorways({List<ShoesColorway> colorways}) {
    return Text(
      "${colorways.length} colours",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 12,
        color: Colors.grey
      ),
    );

    // return Column(
    //   children: [
    //     SizedBox(height: 12),
    //     Container(
    //       height: 32,
    //       child: ListView.separated(
    //         scrollDirection: Axis.horizontal,
    //         itemCount: colorways.length,
    //         itemBuilder: (_, index) {
    //           return colorways[index].images.isNotEmpty
    //             ? AspectRatio(
    //               aspectRatio: 1,
    //               child: GestureDetector(
    //                 onTap: () {
    //                   setState(() => selectedColorway = index);
    //                 },
    //                 child: Card(
    //                   elevation: 0,
    //                   shape: RoundedRectangleBorder(
    //                     borderRadius: BorderRadius.all(Radius.circular(4)),
    //                     side: BorderSide(
    //                       width: 2,
    //                       color: index == selectedColorway
    //                         ? colorPrimary
    //                         : Colors.transparent
    //                     )
    //                   ),
    //                   margin: EdgeInsets.zero,
    //                   child: Image.network(
    //                     // placeholder: (_, value) => Image.asset(
    //                     //   'assets/images/shoestore_no_image.png',
    //                     //   width: double.infinity,
    //                     //   fit: BoxFit.cover,
    //                     // ),
    //                     // imageUrl: baseUrl + colorways[index].images[0].image,
    //                     baseUrl + colorways[index].images[0].image,
    //                     width: 32,
    //                     fit: BoxFit.cover,
    //                   ),
    //                 ),
    //               ),
    //             )
    //             : Container();
    //         },
    //         separatorBuilder: (_, index) {
    //           return colorways[index].images.isNotEmpty
    //           ? SizedBox(width: 8)
    //           : Container();
    //         },
    //       ),
    //     )
    //   ],
    // );
  }
}
