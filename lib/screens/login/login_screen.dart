import 'package:flutter/material.dart';
import 'package:furniture_app/screens/Login/components/body.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  read() async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = prefs.get(key) ?? 0;
    print('read : $value');
    if (value != 0) {
      Navigator.pushNamed(context, HomeScreen.routeName);
      // } else if (value == 0) {
      //   Navigator.pushNamed(context, LoginScreen.routeName);
      // }
    }
  }

  @override
  void initState() {
    read();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Body(),
    );
  }
}
