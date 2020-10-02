import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/payment/existing-cards.dart';

class PaymentScreen extends StatefulWidget {
  static String routeName = "/payment";

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  onItemPress(BuildContext context, int index) async {
    switch (index) {
      case 0:
        //payViaNewCard(context);
        break;
      case 1:
        Navigator.pushNamed(context, ExistingCardsScreen.routeName);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Center(child: Text('Payment Method')),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) {
              Icon icon;
              Text text;

              switch (index) {
                case 0:
                  icon = Icon(Icons.add_circle, color: kPrimaryColor);
                  text = Text('Pay via new card');
                  break;
                case 1:
                  icon = Icon(Icons.credit_card, color: kPrimaryColor);
                  text = Text('Pay via existing card');
                  break;
              }

              return InkWell(
                onTap: () {
                  onItemPress(context, index);
                },
                child: ListTile(
                  title: text,
                  leading: icon,
                ),
              );
            },
            separatorBuilder: (context, index) => Divider(
                  color: kPrimaryColor,
                ),
            itemCount: 2),
      ),
    );
  }
}
