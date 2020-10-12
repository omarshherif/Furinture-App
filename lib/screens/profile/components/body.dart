import 'package:flutter/material.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/payment/payment_screen.dart';
import 'package:furniture_app/size_config.dart';
import 'info.dart';
import 'profile_menu_item.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
    image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _imageFile = image;
    });
  }

  Future uploadImage() async {
    StorageUploadTask uploadTask = _reference.putFile(_imageFile);
    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
    // setState(() async {
    //   imageLink = await _reference.getDownloadURL();
    //   print(imageLink);
    // });
  }

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    getLink();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Info(
            image: (imageLink != null)
                ? imageLink
                : "https://media.salon.com/2013/01/Facebook-no-profile-picture-icon-620x389.jpg",
            name: (FirebaseAuth.instance.currentUser.displayName == null)
                ? ""
                : FirebaseAuth.instance.currentUser.displayName,
            email: FirebaseAuth.instance.currentUser.email,
          ),
          RaisedButton(
            child: Text('Edit picture'),
            onPressed: () async {
              await getImage();
              await uploadImage();
              await FirebaseFirestore.instance
                  .collection('user profile picture')
                  .add({
                'uid': FirebaseAuth.instance.currentUser.uid,
                'profileImageLink': (await _reference.getDownloadURL()),
              });
            },
          ),
          SizedBox(height: SizeConfig.defaultSize * 2), //20
          ProfileMenuItem(
            iconSrc: "assets/icons/cart.svg",
            title: translator.translate('Your Cart'),
            press: () {
              Navigator.pushNamed(context, CartScreen.routeName);
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/payment.svg",
            title: translator.translate('Payment Method'),
            press: () {
              Navigator.pushNamed(context, PaymentScreen.routeName);
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/language.svg",
            title: translator.translate('Change Language'),
            press: () {
              translator.setNewLanguage(
                context,
                newLanguage: translator.currentLanguage == 'ar' ? 'en' : 'ar',
                remember: true,
                restart: true,
              );
            },
          ),
          ProfileMenuItem(
            iconSrc: "assets/icons/help.svg",
            title: translator.translate('Help'),
            press: () {},
          ),
        ],
      ),
    );
  }
}
