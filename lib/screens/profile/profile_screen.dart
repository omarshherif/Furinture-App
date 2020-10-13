import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/profile/components/body.dart';
import 'package:furniture_app/size_config.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class ProfileScreen extends StatefulWidget {
  static String routeName = "/profile";

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: kPrimaryColor,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        color: Colors.white,
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      centerTitle: true,
      title: Text(translator.translate('Profile')),
      // actions: <Widget>[
      //   FlatButton(
      //     onPressed: ()
      //     },
      //     child: Text(
      //       translator.translate('Edit'),
      //       style: TextStyle(
      //         color: Colors.white,
      //         fontSize: SizeConfig.defaultSize * 1.6, //16
      //         fontWeight: FontWeight.bold,
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
