import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthBrain {
  FirebaseAuth auth;
  String email;
  String password;
  String phone;
  String vId;

  FirebaseAuthBrain() {
    auth = FirebaseAuth.instance;
  }

  Future registerWithEmail() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print(e.toString());
    }
  }

  void signInWithEmail() async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    final GoogleAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  void verifyPhone(String phone) async {
    await auth.verifyPhoneNumber(
      phoneNumber: '+2$phone',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
        }
      },
      codeSent: (String verificationId, [int resendToken]) async {
        vId = verificationId;
        print('code sent');
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        print('timed out');
      },
    );
    // userStatus();
  }

  void verifySms(String smsCode) async {
    try {
      PhoneAuthCredential phoneAuthCredential =
          PhoneAuthProvider.credential(verificationId: vId, smsCode: smsCode);

      await auth.signInWithCredential(phoneAuthCredential);
    } catch (e) {
      print(e.toString());
    }
  }

  Future signOut() async {
    try {
      return await auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
