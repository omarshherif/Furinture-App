import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:furniture_app/services/firebase_authentication.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/Login/login_screen.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/home/components/body.dart';
import 'package:furniture_app/screens/profile/profile_screen.dart';
import 'package:furniture_app/screens/settings/settings.dart';
import 'package:furniture_app/size_config.dart';
import 'package:image_picker/image_picker.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final FirebaseAuthBrain auth = FirebaseAuthBrain();
  String imageLink;
  File _imageFile;
  StorageReference _reference = FirebaseStorage.instance
      .ref()
      .child('profileImage${FirebaseAuth.instance.currentUser.uid}.jpg');
  String _downloadUrl;

  void getLink() async {
    await FirebaseFirestore.instance
        .collection('user profile picture')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                if (FirebaseAuth.instance.currentUser.uid ==
                    doc.data()['uid']) {
                  setState(() {
                    imageLink = doc.data()['profileImageLink'];
                    return;
                  });
                }
              })
            });
  }

  Future getImage() async {
    File image;
    // ignore: deprecated_member_use
    image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _imageFile = image;
      print('Image Path $_imageFile');
    });
  }

  Future uploadImage() async {
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    setState(() async {
      print('Profile Picture Uploaded');
      Scaffold.of(context)
          .showSnackBar(SnackBar(content: Text("Profile Picture Uploaded")));
    });
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getLink();
  }

  @override
  Widget build(BuildContext context) {
    // It help us to  make our UI responsive

    SizeConfig().init(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Color(0xFF171717),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName:
                    (FirebaseAuth.instance.currentUser.displayName != null)
                        ? Text(FirebaseAuth.instance.currentUser.displayName)
                        : Text(""),
                accountEmail: Text(FirebaseAuth.instance.currentUser.email),
                currentAccountPicture: GestureDetector(
                  child: CircleAvatar(
                    backgroundColor: kPrimaryLightColor,
                    child: ClipOval(
                      child: (imageLink != null)
                          ? CachedNetworkImage(
                              imageUrl: imageLink,
                            )
                          : Image.network(
                              "https://media.salon.com/2013/01/Facebook-no-profile-picture-icon-620x389.jpg",
                              fit: BoxFit.fill,
                            ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF6F35A5),
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: kPrimaryColor,
                  ),
                  title: Text(
                    translator.translate('Profile'),
                    style: kDrawerTextStyle,
                  ),
                  onTap: () {
                    setState(() {
                      //_seleted = true;
                    });
                    Navigator.pushNamed(context, ProfileScreen.routeName);
                  },
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    translator.translate('Cart'),
                    style: kDrawerTextStyle,
                  ),
                  leading: Icon(
                    Icons.shopping_cart,
                    color: kPrimaryColor,
                  ),
                  onTap: () {
                    setState(() {});

                    Navigator.pushNamed(context, CartScreen.routeName);
                  },
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    translator.translate('Settings'),
                    style: kDrawerTextStyle,
                  ),
                  leading: Icon(
                    Icons.settings,
                    color: kPrimaryColor,
                  ),
                  onTap: () {
                    setState(() {});
                    Navigator.pushNamed(context, SettingsScreen.routeName);
                  },
                ),
              ),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    translator.translate('Help'),
                    style: kDrawerTextStyle,
                  ),
                  leading: Icon(
                    Icons.help,
                    color: kPrimaryColor,
                  ),
                  onTap: () {},
                ),
              ),
              Divider(),
              Card(
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                color: Colors.white,
                child: ListTile(
                  leading: Icon(
                    Icons.exit_to_app,
                    color: kPrimaryColor,
                  ),
                  title: Text(
                    translator.translate('Logout'),
                    style: kDrawerTextStyle,
                  ),
                  onTap: () async {
                    await auth.signOut();
                    Navigator.pushNamed(context, LoginScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
        body: Body(),
      ),
    );
  }
}
