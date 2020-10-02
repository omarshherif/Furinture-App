import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/payment/payment_screen.dart';
import 'package:furniture_app/size_config.dart';
import 'info.dart';
import 'profile_menu_item.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/pic.png",
            name: "Omar Sherif",
            email: "omarshherif@yahoo.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          ProfileMenuItem(
            iconSrc: "assets/icons/cart.svg",
            title: "Your Cart",
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/payment.svg",
            title: "Payment Method",
            press: () {
              Navigator.pushNamed(context, PaymentScreen.routeName);
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg",
            title: "Change Language",
            press: () {},
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/help.svg",
            title: "Help",
            press: () {},
          ),
        ],
      ),
    );
  }
}
