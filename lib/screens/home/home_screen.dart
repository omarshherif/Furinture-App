// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/Login/login_screen.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/home/components/body.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';
import 'package:furniture_app/screens/settings/settings.dart';
import 'package:furniture_app/size_config.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
                  backgroundImage: AssetImage("assets/images/pic.png"),
                ),
              ),
              decoration: BoxDecoration(
                color: Color(0xFF6F35A5),
              ),
            ),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.account_circle),
                title: Text(
                  'Profile',
                  style: kDrawerTextStyle,
                ),
                onTap: () {
                  setState(() {
                    //_seleted = true;
                  });
                  Navigator.pushNamed(context, ProfileScreen.routeName);
                },
              ),
            ),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  'Cart',
                  style: kDrawerTextStyle,
                ),
                leading: Icon(Icons.shopping_cart),
                onTap: () {
                  setState(() {});

                  Navigator.pushNamed(context, CartScreen.routeName);
                },
              ),
            ),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  'Settings',
                  style: kDrawerTextStyle,
                ),
                leading: Icon(Icons.settings),
                onTap: () {
                  setState(() {});
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
              ),
            ),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.white,
              child: ListTile(
                title: Text(
                  'Help',
                  style: kDrawerTextStyle,
                ),
                leading: Icon(Icons.help),
                onTap: () {
                  setState(() {});
                },
              ),
            ),
            Divider(),
            Card(
              elevation: 2.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0)),
              color: Colors.white,
              child: ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text(
                  'Logout',
                  style: kDrawerTextStyle,
                ),
                onTap: () {
                  Navigator.pushNamed(context, LoginScreen.routeName);
                },
              ),
            ),
          ],
        ),
      ),
      body: Body(),
    );
  }
}
