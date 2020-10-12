import 'package:flutter/material.dart';
import 'package:furniture_app/models/Cart.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:furniture_app/services/fetchProducts.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
//import 'package:furniture_app/models/Cart.dart';

class ProductDescription extends StatefulWidget {
  const ProductDescription({
    Key key,
    @required this.product,
    this.press,
  }) : super(key: key);

  final Product product;
  final Function press;

  @override
  _ProductDescriptionState createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 8, //90
        left: defaultSize * 2, //20
        right: defaultSize * 2,
      ),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              translator.translate("subTitle"),
              style: TextStyle(
                fontSize: defaultSize * 1.8,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4.0),
            Text(
              translator.translate("description"),
              style: TextStyle(
                color: kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(height: 10.0),
            SizedBox(
              width: double.infinity,
              child: FlatButton(
                padding: EdgeInsets.all(defaultSize * 1.5),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: kPrimaryColor,
                onPressed: () {
                  setState(() {
                    cartItems.add(
                      Cart(
                          numOfItem: 1,
                          // product:
                          //     demoProducts[int.parse(widget.product.id) - 1]),
                          product: myProducts[int.parse(widget.product.id)]),
                      // product: myProducts
                    );
                  });
                  //Navigator.pushNamed(context, CartScreen.routeName);
                },
                child: Text(
                  translator.translate('Add to Cart'),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: defaultSize * 1.6,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
