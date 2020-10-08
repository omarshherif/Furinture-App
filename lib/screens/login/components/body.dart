import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Signup/signup_screen.dart';
import 'package:furniture_app/components/already_have_an_account_acheck.dart';
import 'package:furniture_app/components/rounded_button.dart';
import 'package:furniture_app/components/rounded_input_field.dart';
import 'package:furniture_app/components/rounded_password_field.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:furniture_app/services/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:email_validator/email_validator.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  FirebaseAuthBrain firebaseAuthBrain = FirebaseAuthBrain();
  static String email = '';
  bool get validEmail => EmailValidator.validate(email);
  bool _saving = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ModalProgressHUD(
          color: kPrimaryLightColor,
          opacity: 0.2,
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
                Text(
                  translator.translate('LOGIN'),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.white.withOpacity(0.6),
                      letterSpacing: 5.0),
                ),
                SizedBox(height: 50.0),
                RoundedInputField(
                  hintText: translator.translate('Your Email'),
                  onChanged: (value) {
                    email = value;
                    firebaseAuthBrain.email = value;
                  },
                ),
                RoundedPasswordField(
                  hintText: translator.translate('Password'),
                  onChanged: (value) {
                    firebaseAuthBrain.password = value;
                  },
                ),
                RoundedButton(
                  text: translator.translate('LOGIN'),
                  press: () {
                    setState(() {
                      _saving = true;
                    });
                    firebaseAuthBrain.auth.signOut();
                    firebaseAuthBrain.signInWithEmail();
                    firebaseAuthBrain.auth
                        .authStateChanges()
                        .listen((User user) {
                      if (user != null && validEmail == true) {
                        print('Email is valid? ' + (validEmail ? 'Yes' : 'No'));

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
          inAsyncCall: _saving,
        ),
      ),
    );
  }
}
