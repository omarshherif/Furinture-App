import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Signup/components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/signup";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
