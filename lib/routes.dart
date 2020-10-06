import 'package:flutter/widgets.dart';
import 'package:furniture_app/models/Product.dart';
import 'package:furniture_app/screens/Welcome/welcome_screen.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/changePassword/changePassword_screen.dart';
import 'package:furniture_app/screens/details/details_screen.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:furniture_app/screens/Login/login_screen.dart';
import 'package:furniture_app/screens/otp/enterNum_screen.dart';
import 'package:furniture_app/screens/otp/otp_screen.dart';
import 'package:furniture_app/screens/payment/existing-cards.dart';
import 'package:furniture_app/screens/payment/payment_screen.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';
import 'screens/settings/settings.dart';
import 'screens/Signup/signup_screen.dart';

// We use name route
// All our routes will be available here
final Map<String, WidgetBuilder> routes = {
  WelcomeScreen.routeName: (context) => WelcomeScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
  DetailsScreen.routeName: (context) => DetailsScreen(product: product),
  CartScreen.routeName: (context) => CartScreen(),
  ProfileScreen.routeName: (context) => ProfileScreen(),
  SettingsScreen.routeName: (context) => SettingsScreen(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  ExistingCardsScreen.routeName: (context) => ExistingCardsScreen(),
  EnterNumberScreen.routeName: (context) => EnterNumberScreen(),
  ChangePasswordScreen.routeName: (context) => ChangePasswordScreen(),
};
