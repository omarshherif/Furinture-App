import 'package:flutter/material.dart';
import 'size_config.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Colors.white60;

const kSecondaryColor = Color(0xFFF3F6F8);
const kTextColor = Color(0xFF171717);
final kHintTextStyle = TextStyle(
  color: Color(0xFFBDBDBD),
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Color(0xFFBDC9D3),
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);
final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);
final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);
OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: BorderSide(color: kTextColor),
  );
}

const kTextLigntColor = Color(0xFF7286A5);
final kDrawerTextStyle = TextStyle(color: Color(0xFF7286A5), fontSize: 15.0);

const double kSizeBoxWidth = 49;
const double kNumberFontSize = 13;
