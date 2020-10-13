import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/models/Cart.dart';
import '../../../size_config.dart';
import 'cart_card.dart';

int itemCount = 0;

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  void getCount() {
    setState(() {
      itemCount = cartItems.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Dismissible(
            key: Key(cartItems[index].product.id),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              setState(() {
                if (cartItems.length != 0) {
                  cartItems.removeAt(index);
                  // price -= cartItems[index].product.price;
                  getCount();
                  print(cartItems.length);
                  //ValueNotifier(itemCount);

                  print(itemCount);
                }
              });

              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text("Product Dismissed"),
              ));
            },
            background: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Color(0xFFFFE6E6),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Spacer(),
                  SvgPicture.asset("assets/icons/Trash.svg"),
                ],
              ),
            ),
            child: CartCard(cart: cartItems[index]),
          ),
        ),
      ),
    );
  }
}
