import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/components/default_button.dart';
import 'package:furniture_app/models/Cart.dart';
import 'package:furniture_app/screens/payment/payment_screen.dart';
import '../../../size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class CheckoutCard extends StatefulWidget {
  @override
  _CheckoutCardState createState() => _CheckoutCardState();
}

class _CheckoutCardState extends State<CheckoutCard> {
  // @override
  // Widget build(BuildContext context) {
  // return Container();
  // }
// }

// class CheckoutCard extends StatelessWidget {
//   const CheckoutCard({
//     Key key,
//   }) : super(key: key);
  String cardNumber;

  int calculatePrice() {
    int price = 0;
    for (int i = 0; i < cartItems.length; i++) {
      price += cartItems[i].product.price;
    }
    return price;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getProportionateScreenWidth(15),
        horizontal: getProportionateScreenWidth(30),
      ),
      // height: 174,
      decoration: BoxDecoration(
        color: Color(0xFFEDE7F6),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -15),
            blurRadius: 20,
            color: Color(0xFFDADADA).withOpacity(0.15),
          )
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: getProportionateScreenWidth(40),
                  width: getProportionateScreenWidth(40),
                  decoration: BoxDecoration(
                    color: Color(0xFFF5F6F9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: SvgPicture.asset("assets/icons/receipt.svg"),
                ),
                Spacer(),
              ],
            ),
            SizedBox(height: getProportionateScreenHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text.rich(
                  TextSpan(
                    text: translator.translate('Total') + ":\n",
                    children: [
                      TextSpan(
                        text: "\$${calculatePrice()}",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: getProportionateScreenWidth(190),
                  child: DefaultButton(
                    text: translator.translate('Check Out'),
                    press: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                content: TextField(
                                  autofocus: true,
                                  keyboardType: TextInputType.number,
                                  onSubmitted: (value) {
                                    setState(() {
                                      cardNumber = value;
                                    });
                                  },
                                ),
                              ));
                      // Navigator.pushNamed(context, PaymentScreen.routeName);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
