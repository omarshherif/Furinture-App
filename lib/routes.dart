import 'package:flutter/widgets.dart';
import 'package:furniture_app/screens/Welcome/welcome_screen.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
//import 'package:shop_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:furniture_app/screens/otp/otp_screen.dart';
import 'package:furniture_app/screens/Login/login_screen.dart';
import 'screens/Signup/signup_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(),
  CartScreen.routeName: (context) => CartScreen(),
};
