import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/otp/otp_screen.dart';
import 'package:furniture_app/services/firebase_authentication.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class EnterNumberScreen extends StatefulWidget {
  static String routeName = "/enterNum";
  const EnterNumberScreen({Key key}) : super(key: key);
  @override
  _EnterNumberScreenState createState() => _EnterNumberScreenState();
}

class _EnterNumberScreenState extends State<EnterNumberScreen> {
  TextEditingController phoneController = TextEditingController();
  FirebaseAuthBrain firebaseAuthBrain = FirebaseAuthBrain();
  String phone;
  // String verificationId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: <Widget>[
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: Stack(
                            children: <Widget>[
                              Center(
                                child: Container(
                                  height: 240,
                                  constraints:
                                      const BoxConstraints(maxWidth: 500),
                                  margin: const EdgeInsets.only(top: 100),
                                  decoration: const BoxDecoration(
                                      color: Color(0xFFE1E0F5),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(30))),
                                ),
                              ),
                              Center(
                                child: Container(
                                    constraints:
                                        const BoxConstraints(maxHeight: 340),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child:
                                        Image.asset('assets/images/login.png')),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            translator.translate('Furniture App'),
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: <Widget>[
                        Container(
                            constraints: const BoxConstraints(maxWidth: 500),
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(children: <TextSpan>[
                                TextSpan(
                                    text: translator
                                        .translate('We will send you an '),
                                    style: TextStyle(color: kPrimaryColor)),
                                TextSpan(
                                    text: translator
                                        .translate('One Time Password '),
                                    style: TextStyle(
                                        color: kPrimaryColor,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                    text: translator
                                        .translate('on this mobile number '),
                                    style: TextStyle(color: kPrimaryColor)),
                              ]),
                            )),
                        Container(
                          height: 40,
                          constraints: const BoxConstraints(maxWidth: 500),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: CupertinoTextField(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(4))),
                            controller: phoneController,
                            clearButtonMode: OverlayVisibilityMode.editing,
                            keyboardType: TextInputType.phone,
                            maxLines: 1,
                            placeholder: '+33...',
                            onSubmitted: (value) {
                              setState(() {
                                phone = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          constraints: const BoxConstraints(maxWidth: 500),
                          child: RaisedButton(
                            onPressed: () {
                              firebaseAuthBrain.verifyPhone(phone);
                              // Navigator.pushNamed(context, OtpScreen.routeName);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => OtpScreen(
                                    // verificationId: verificationId,
                                    firebaseAuthBrain: firebaseAuthBrain,
                                  ),
                                ),
                              );
                            },
                            color: kPrimaryColor,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(29))),
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    translator.translate('Next'),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(15),
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(20)),
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
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
