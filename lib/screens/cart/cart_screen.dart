import 'package:flutter/material.dart';
import 'package:furniture_app/models/Cart.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'components/body.dart';
import 'components/check_out_card.dart';

class CartScreen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
      bottomNavigationBar: CheckoutCard(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: <Widget>[
        FlatButton(
            child: Text(
              "Clear",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              setState(() {
                cartItems = [];
                itemCount = 0;
              });
            })
      ],
      title: Column(
        children: [
          Text(
            translator.translate('Your Cart'),
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "$itemCount " + translator.translate('items'),
            style: Theme.of(context).textTheme.caption,
          ),
        ],
      ),
    );
  }
}
