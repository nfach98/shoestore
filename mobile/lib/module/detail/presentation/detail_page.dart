import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mobile/module/detail/presentation/arguments/detail_page_arguments.dart';
import 'package:mobile/module/detail/presentation/notifier/detail_notifier.dart';
import 'package:provider/provider.dart';

import '../../../common/constant/api_path_constants.dart';

class DetailPage extends StatefulWidget {
  final DetailPageArguments arguments;

  const DetailPage({Key? key, required this.arguments}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      context.read<DetailNotifier>().getShoes(id: widget.arguments.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final shoes = context.select((DetailNotifier n) => n.shoes);

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12.0),
                  child: shoes?.image == null
                  ? Image.asset(
                    'assets/images/shoestore_no_image.png',
                    fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                    imageUrl: '${ApiPathConstants.baseUrl}${shoes?.image}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'AAAA',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      SizedBox(height: 12),
                      Text(
                        'AAAA',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      ),
    );
  }
}
