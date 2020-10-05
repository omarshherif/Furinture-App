import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

import 'product_description.dart';
import 'product_info.dart';

class Body extends StatelessWidget {
  final Product product;

  const Body({Key key, this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight - AppBar().preferredSize.height,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(product: product),
            Positioned(
              top: defaultSize * 37,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: translator.currentLanguage == 'en'
                  ? -defaultSize * 3.5
                  : defaultSize * 8.5,
              child: Hero(
                tag: product.id,
                child: CachedNetworkImage(
                  imageUrl: product.image,
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8, //378
                  width: defaultSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
