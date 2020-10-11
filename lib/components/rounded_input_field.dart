import 'package:flutter/material.dart';
import 'text_field_container.dart';
import 'package:furniture_app/constants.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final TextInputType textInputType;
  final bool doFocus;
  final Function onSubmitted;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.email,
    this.onChanged,
    this.textInputType,
    this.doFocus = false,
    this.onSubmitted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        keyboardType: textInputType,
        autofocus: doFocus,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
