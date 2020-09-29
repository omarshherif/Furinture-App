import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Login/components/background.dart';
import 'package:furniture_app/Screens/Signup/signup_screen.dart';
import 'package:furniture_app/components/already_have_an_account_acheck.dart';
import 'package:furniture_app/components/rounded_button.dart';
import 'package:furniture_app/components/rounded_input_field.dart';
import 'package:furniture_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:furniture_app/services/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuthBrain firebaseAuthBrain = FirebaseAuthBrain();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {
                firebaseAuthBrain.email = value;
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                firebaseAuthBrain.password = value;
              },
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                // Navigator.pushNamed(context, HomeScreen.routeName);
                firebaseAuthBrain.auth.signOut();
                firebaseAuthBrain.signInWithEmail();
                firebaseAuthBrain.auth.authStateChanges().listen((User user) {
                  if (user != null) {
                    print('User is signed in!');
                    Navigator.pushNamed(context, HomeScreen.routeName);
                    // return true;
                  }
                });
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
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
    );
  }
}
