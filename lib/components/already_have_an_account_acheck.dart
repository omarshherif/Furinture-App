import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login
              ? translator.translate('Don’t have an Account ? ')
              : translator.translate('Already have an Account ? '),
          style: TextStyle(color: kPrimaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login
                ? translator.translate('Sign Up')
                : translator.translate('Sign In'),
            style: TextStyle(
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}
