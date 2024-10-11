import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignin;
  FirebaseAuthDataSource(this.firebaseAuth, this.googleSignin);
  Future<UserCredential> googleSignIn() async {
    log("remote data source line 9");
    final googleUser = await googleSignin.signIn();
    final googleAuth = await googleUser?.authentication;
    final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    final userCredential = await firebaseAuth.signInWithCredential(credentials);
    return userCredential;
  }
}
