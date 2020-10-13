import 'package:flutter/material.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/screens/cart/cart_screen.dart';
import 'package:furniture_app/screens/payment/payment_screen.dart';
import 'package:furniture_app/size_config.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
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
  bool _saving = false;
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
    return ModalProgressHUD(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Info(
              image: (imageLink != null)
                  ? imageLink
                  : "https://media.salon.com/2013/01/Facebook-no-profile-picture-icon-620x389.jpg",
              name: (FirebaseAuth.instance.currentUser.displayName == null)
                  ? "Hi! User"
                  : "Hi!" + FirebaseAuth.instance.currentUser.displayName,
              email: FirebaseAuth.instance.currentUser.email,
            ),
            SizedBox(
              height: 12.0,
            ),
            FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29)),
                child: Text(
                  'Edit picture',
                  style: TextStyle(
                    fontSize: getProportionateScreenWidth(14),
                    color: Colors.white,
                  ),
                ),
                color: kPrimaryColor,
                onPressed: () async {
                  setState(() {
                    _saving = true;
                  });

                  await getImage();
                  await uploadImage();
                  await FirebaseFirestore.instance
                      .collection('user profile picture')
                      .add({
                    'uid': FirebaseAuth.instance.currentUser.uid,
                    'profileImageLink': (await _reference.getDownloadURL()),
                  });
                }),
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
      ),
      inAsyncCall: false,
    );
  }
}
