import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthDataSource {
  FirebaseAuthDataSource();

  final signIn = GoogleSignIn();
  final firebaseAuth = FirebaseAuth.instance;
  
  Future<UserCredential> googleSignIn() async {
    final googleUser = await signIn.signIn();
    final googleAuth = await googleUser?.authentication;
    final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    final userCredential = await firebaseAuth.signInWithCredential(credentials);
    return userCredential;
  }

  Future<void> userSignOut() async {
    await firebaseAuth.signOut();
  }
}
