import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Login/login_screen.dart';
import 'package:furniture_app/Screens/Signup/signup_screen.dart';
import 'package:furniture_app/components/rounded_button.dart';
import 'package:furniture_app/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return MaterialApp(
        home: Scaffold(
            body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/furniture.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Text(
              translator.translate('Welcome'),
              style: TextStyle(
                  color: kPrimaryColor.withOpacity(0.5),
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  letterSpacing: 4.0,
                  fontFamily: 'Cinzel-VariableFont_wght'),
            ),
            SizedBox(height: 120),
            RoundedButton(
              text: translator.translate('Sign In'),
              color: kPrimaryColor.withOpacity(0.6),
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: translator.translate('SIGNUP'),
              color: kPrimaryLightColor.withOpacity(0.4),
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    )));
  }
}
