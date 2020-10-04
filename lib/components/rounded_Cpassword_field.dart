import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'text_field_container.dart';
import 'package:furniture_app/constants.dart';

class RoundedCPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  const RoundedCPasswordField({
    Key key,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: translator.translate('Confirm Password'),
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
