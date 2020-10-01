import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/home/components/body.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';
import 'package:furniture_app/size_config.dart';
import 'package:furniture_app/services/firebase_authentication.dart';

class HomeScreen extends StatelessWidget {
  static String routeName = "/home";
  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Color(0xFF171717),
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Omar Sherif"),
              accountEmail: Text("omarshherif@yahoo.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  //backgroundImage: NetworkImage(''),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF6F35A5),
              ),
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text(
                'Profile',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                Navigator.pushNamed(context, ProfileScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Cart',
                style: kDrawerTextStyle,
              ),
              leading: Icon(Icons.shopping_cart),
              onTap: () {
                Navigator.pushNamed(context, CartScreen.routeName);
              },
            ),
            ListTile(
              title: Text(
                'Settings',
                style: kDrawerTextStyle,
              ),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            ListTile(
              title: Text(
                'Help',
                style: kDrawerTextStyle,
              ),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.close),
              title: Text(
                'Logout',
                style: kDrawerTextStyle,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Body(),
    );
  }
}
