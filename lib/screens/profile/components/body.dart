import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/payment/payment_screen.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';
import 'package:furniture_app/size_config.dart';
import 'info.dart';
import 'profile_menu_item.dart';

import 'package:localize_and_translate/localize_and_translate.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: "assets/images/user.png",
            name: "Omar Sherif",
            email: "omarshherif@yahoo.com",
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          ProfileMenuItem(
            iconSrc: "assets/icons/cart.svg",
            title: translator.translate('Your Cart'),
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/payment.svg",
            title: translator.translate('Payment Method'),
            press: () {
              Navigator.pushNamed(context, PaymentScreen.routeName);
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg",
            title: translator.translate('Change Language'),
            press: () {
              translator.setNewLanguage(
                context,
                newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                remember: true,
                restart: true,
              );
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/help.svg",
            title: translator.translate('Help'),
            press: () {},
          ),
        ],
      ),
    );
  }
}
