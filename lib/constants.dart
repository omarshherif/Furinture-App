import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF6F35A5);
const kPrimaryLightColor = Color(0xFFF1E6FF);

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
