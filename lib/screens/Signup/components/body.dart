import 'package:flutter/material.dart';
import 'package:furniture_app/Screens/Login/login_screen.dart';
import 'package:furniture_app/Screens/Signup/components/background.dart';
import 'package:furniture_app/Screens/Signup/components/or_divider.dart';
import 'package:furniture_app/Screens/Signup/components/social_icon.dart';
import 'package:furniture_app/components/already_have_an_account_acheck.dart';
import 'package:furniture_app/components/rounded_button.dart';
import 'package:furniture_app/components/rounded_input_field.dart';
import 'package:furniture_app/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furniture_app/screens/home/home_screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "SIGNUP",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ),
            RoundedInputField(
              hintText: "Your Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "SIGNUP",
              press: () {
                Navigator.pushNamed(context, HomeScreen.id);
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
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
