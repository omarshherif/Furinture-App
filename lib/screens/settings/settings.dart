import 'package:cached_network_image/cached_network_image.dart';
import 'package:furniture_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/screens/changePassword/changePassword_screen.dart';
import 'package:localize_and_translate/localize_and_translate.dart';

class SettingsScreen extends StatefulWidget {
  static String routeName = "/settings";
  static final String path = "lib/screens/settings/settings.dart";

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      isMaterialAppTheme: true,
      data: ThemeData(
        brightness: Brightness.light,
      ),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          brightness: Brightness.light,
          iconTheme: IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          title: Text(
            translator.translate('Settings'),
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Card(
                    elevation: 8.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    color: kPrimaryColor,
                    child: ListTile(
                      onTap: () {
                        //open edit profile
                      },
                      title: Text(
                        "Omar Sherif",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                      trailing: Icon(
                        Icons.edit,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Card(
                    elevation: 4.0,
                    margin: const EdgeInsets.fromLTRB(32.0, 8.0, 32.0, 16.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: Icon(
                            Icons.lock_outline,
                            color: kPrimaryColor,
                          ),
                          title: Text(translator.translate('Change Password')),
                          trailing: Icon(translator.currentLanguage == 'en'
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left),
                          onTap: () {
                            Navigator.pushNamed(
                                context, ChangePasswordScreen.routeName);
                          },
                        ),
                        _buildDivider(),
                        ListTile(
                          leading: Icon(
                            FontAwesomeIcons.language,
                            color: kPrimaryColor,
                          ),
                          title: Text(translator.translate('Change Language')),
                          trailing: Icon(translator.currentLanguage == 'en'
                              ? Icons.keyboard_arrow_right
                              : Icons.keyboard_arrow_left),
                          onTap: () {
                            setState(() {
                              translator.setNewLanguage(
                                context,
                                newLanguage: translator.currentLanguage == 'ar'
                                    ? 'en'
                                    : 'ar',
                                remember: true,
                                restart: true,
                              );
                            });
                          },
                        ),
                        _buildDivider(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    translator.translate('Notification Settings'),
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.indigo,
                    ),
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text(translator.translate('Received notification')),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: false,
                    title: Text(translator.translate('Received newsletter')),
                    onChanged: null,
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text(
                        translator.translate('Received Offer Notification')),
                    onChanged: (val) {},
                  ),
                  SwitchListTile(
                    activeColor: kPrimaryColor,
                    contentPadding: const EdgeInsets.all(0),
                    value: true,
                    title: Text(translator.translate('Received App Updates')),
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 60.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _buildDivider() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      width: double.infinity,
      height: 1.0,
      color: Colors.grey.shade400,
    );
  }
}
