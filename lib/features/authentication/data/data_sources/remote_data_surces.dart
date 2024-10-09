import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scrapit/features/authentication/domain/entites/user.dart'
    as scrap;

class FirebaseAuthDataSource {
  final FirebaseAuth firebaseAuth;
  final GoogleSignIn googleSignin;
  FirebaseAuthDataSource(this.firebaseAuth, this.googleSignin);
  Future<scrap.User> googleSignIn() async {
    final googleUser = await googleSignin.signIn();
    final googleAuth = await googleUser?.authentication;
    final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

    final userCredential = await firebaseAuth.signInWithCredential(credentials);
    return scrap.User(
        id: userCredential.user?.uid,
        name: userCredential.user?.displayName,
        email: userCredential.user?.email);
  }
}
