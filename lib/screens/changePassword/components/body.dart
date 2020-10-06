import 'package:flutter/material.dart';
import 'package:furniture_app/components/rounded_password_field.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/changePassword/components/background.dart';
import 'package:furniture_app/services/firebase_authentication.dart';
import 'package:furniture_app/components/rounded_button.dart';
import 'package:furniture_app/components/rounded_input_field.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:firebase_auth/firebase_auth.dart';

String newPassword = "";
String cPassword = "";

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                translator.translate('Change Password'),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    letterSpacing: 5.0,
                    color: kPrimaryColor.withOpacity(0.7)),
              ),
              SizedBox(height: size.height * 0.03),
              SizedBox(height: size.height * 0.03),
              RoundedPasswordField(
                hintText: translator.translate('Current Password'),
                onChanged: (value) {},
              ),
              RoundedPasswordField(
                hintText: translator.translate('New Password'),
                onChanged: (value) {
                  newPassword = value;
                },
              ),
              RoundedPasswordField(
                hintText: translator.translate('Confirm New Password'),
                onChanged: (value) {
                  cPassword = value;
                },
              ),
              RoundedButton(
                text: translator.translate('Confirm'),
                press: () {
                  if (newPassword == cPassword) {
                    FirebaseAuth.instance.currentUser
                        .updatePassword(newPassword);
                  } else {
                    return showDialog(
                      context: context,
                      builder: (_) => AlertDialog(),
                      barrierDismissible: false,
                      child: AlertDialog(
                        title: Text("Error"),
                        actions: [
                          FlatButton(
                            child: Text("Ok"),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                        elevation: 15.0,
                        backgroundColor: Colors.black54,
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: size.height * 0.03),
            ],
          ),
        ),
      ),
    );
  }
}
