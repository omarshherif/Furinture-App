import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Login/login_screen.dart';
import 'package:furniture_app/Screens/Signup/components/background.dart';
import 'package:furniture_app/Screens/Signup/components/or_divider.dart';
import 'package:furniture_app/Screens/Signup/components/social_icon.dart';
import 'package:furniture_app/components/already_have_an_account_acheck.dart';
import 'package:furniture_app/components/rounded_Cpassword_field.dart';
import 'package:furniture_app/components/rounded_Ninput_field.dart';
import 'package:furniture_app/components/rounded_button.dart';
import 'package:furniture_app/components/rounded_input_field.dart';
import 'package:furniture_app/components/rounded_password_field.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:furniture_app/screens/otp/enterNum_screen.dart';
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
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/images/furniture1.jpg",
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 110,
                ),
                Text(
                  "SIGNUP",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white38,
                      letterSpacing: 5.0),
                ),
                SizedBox(height: size.height * 0.03),
                RoundedNInputField(
                  hintText: "Your Name",
                  onChanged: (value) {
                    setState(() {
                      //firebaseAuthBrain.email = value;
                    });
                  },
                ),
                RoundedInputField(
                  hintText: "Your Email",
                  onChanged: (value) {
                    setState(() {
                      firebaseAuthBrain.email = value;
                    });
                  },
                ),
                RoundedPasswordField(
                  onChanged: (value) {
                    setState(() {
                      firebaseAuthBrain.password = value;
                    });
                  },
                ),
                RoundedCPasswordField(
                  onChanged: (value) {
                    setState(() {
                      //firebaseAuthBrain.password = value;
                    });
                  },
                ),
                RoundedButton(
                  text: "SIGNUP",
                  press: () async {
                    firebaseAuthBrain.auth.signOut();
                    await firebaseAuthBrain.registerWithEmail();
                    firebaseAuthBrain.auth
                        .authStateChanges()
                        .listen((User user) {
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
                  login: false,
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
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      iconSrc: "assets/icons/smartphone.svg",
                      press: () {
                        Navigator.pushNamed(
                            context, EnterNumberScreen.routeName);
                      },
                    ),
                    SocalIcon(
                      iconSrc: "assets/icons/google.svg",
                      press: () async {
                        await firebaseAuthBrain.signInWithGoogle();
                        firebaseAuthBrain.auth
                            .authStateChanges()
                            .listen((User user) {
                          if (user != null) {
                            print('User is signed in!');
                            Navigator.pushNamed(context, HomeScreen.routeName);
                            // return true;
                          }
                        });
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
