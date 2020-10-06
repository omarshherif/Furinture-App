import 'package:flutter/material.dart';
import 'package:furniture_app/screens/changePassword/components/body.dart';

class ChangePasswordScreen extends StatelessWidget {
  static String routeName = "/changePassword";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
