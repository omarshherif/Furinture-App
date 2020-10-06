import 'package:flutter/material.dart';
import 'package:furniture_app/components/text_ChangePass_field_container.dart';
import 'package:furniture_app/constants.dart';

class RoundedChangePasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  final String hintText;
  const RoundedChangePasswordField({
    Key key,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextChangePasswordFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
