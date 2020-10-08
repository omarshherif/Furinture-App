import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/home/home_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:furniture_app/services/firebase_authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'components/OtpNumberBox.dart';

class OtpScreen extends StatefulWidget {
  static String routeName = "/otp";
  final FirebaseAuthBrain firebaseAuthBrain;
  OtpScreen({this.firebaseAuthBrain});
  // const OtpScreen({Key key}) : super(key: key);
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  String text = '';
  String smsCode = "";
  FocusNode pin2FocusNode;
  FocusNode pin3FocusNode;
  FocusNode pin4FocusNode;
  FocusNode pin5FocusNode;
  FocusNode pin6FocusNode;

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode.dispose();
    pin3FocusNode.dispose();
    pin4FocusNode.dispose();
    pin5FocusNode.dispose();
    pin6FocusNode.dispose();
  }

  void _onKeyboardTap(String value) {
    setState(() {
      text = text + value;
    });
  }

  Widget otpNumberWidget(int position) {
    // try {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 0),
          borderRadius: const BorderRadius.all(Radius.circular(8))),
      child: Center(
          child: Text(
        text[position],
        style: const TextStyle(color: Colors.black),
      )),
    );
    // } catch (e) {
    //   return Container(
    //     height: 40,
    //     width: 40,
    //     decoration: BoxDecoration(
    //         border: Border.all(color: Colors.black, width: 0),
    //         borderRadius: const BorderRadius.all(Radius.circular(8))),
    //   );
    // }
  }

  void nextField(String value, FocusNode focusNode) {
    if (value.length == 1) {
      focusNode.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(
            icon: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                color: kPrimaryLightColor.withAlpha(20),
              ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: kPrimaryColor,
                size: 16,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          brightness: Brightness.light,
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                  translator.translate(
                                      'Enter 6 digits verification code sent to your number'),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500))),
                          Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                OtpNumberBox(
                                  autoFocus: true,
                                  onChanged: (value) {
                                    smsCode = '$smsCode$value';
                                    nextField(value, pin2FocusNode);
                                  },
                                ),
                                OtpNumberBox(
                                  focusNode: pin2FocusNode,
                                  onChanged: (value) {
                                    smsCode = '$smsCode$value';
                                    nextField(value, pin3FocusNode);
                                  },
                                ),
                                OtpNumberBox(
                                  focusNode: pin3FocusNode,
                                  onChanged: (value) {
                                    smsCode = '$smsCode$value';
                                    nextField(value, pin4FocusNode);
                                  },
                                ),
                                OtpNumberBox(
                                  focusNode: pin4FocusNode,
                                  onChanged: (value) {
                                    smsCode = '$smsCode$value';
                                    nextField(value, pin5FocusNode);
                                  },
                                ),
                                OtpNumberBox(
                                  focusNode: pin5FocusNode,
                                  onChanged: (value) {
                                    smsCode = '$smsCode$value';
                                    nextField(value, pin6FocusNode);
                                  },
                                ),
                                OtpNumberBox(
                                  focusNode: pin6FocusNode,
                                  onChanged: (value) {
                                    smsCode = '$smsCode$value';
                                    widget.firebaseAuthBrain.verifySms(smsCode);
                                    pin6FocusNode.unfocus();
                                    widget.firebaseAuthBrain.auth
                                        .authStateChanges()
                                        .listen(
                                      (User user) {
                                        if (user != null) {
                                          print('User is signed in!');
                                          // Navigator.pushNamed(context, HomeScreen.routeName);
                                          Navigator.of(context)
                                              .pushNamedAndRemoveUntil(
                                                  HomeScreen.routeName,
                                                  (Route<dynamic> route) =>
                                                      false);
                                        }
                                      },
                                    );
                                    print(smsCode);
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      constraints: const BoxConstraints(maxWidth: 500),
                      child: RaisedButton(
                        onPressed: () {
                          //loginStore.validateOtpAndLogin(context, text);
                        },
                        color: kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(29))),
                        child: Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                translator.translate('Confirm'),
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                              ),
                              Container(
                                padding: EdgeInsets.all(14),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  color: kPrimaryColor,
                                ),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    // NumericKeyboard(
                    //   onKeyboardTap: _onKeyboardTap,
                    //   textColor: kPrimaryLightColor,
                    //   rightIcon: const Icon(
                    //     Icons.backspace,
                    //     color: kPrimaryLightColor,
                    //   ),
                    //   rightButtonFn: () {
                    //     setState(() {
                    //       text = text.substring(0, text.length - 1);
                    //     });
                    //   },
                    // )
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
