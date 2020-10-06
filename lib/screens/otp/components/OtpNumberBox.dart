import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';

class OtpNumberBox extends StatelessWidget {
  final bool autoFocus;
  final FocusNode focusNode;
  final ValueChanged<String> onChanged;
  OtpNumberBox({this.autoFocus = false, this.focusNode, this.onChanged});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: getProportionateScreenWidth(kSizeBoxWidth),
      width: 50,
      child: TextFormField(
        focusNode: focusNode,
        autofocus: autoFocus,
        style: TextStyle(fontSize: kNumberFontSize),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: otpInputDecoration,
        onChanged: onChanged,
      ),
    );
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }
}
