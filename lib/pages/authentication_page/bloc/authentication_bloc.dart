import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:scrapit/class/authentication/user_cred.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    User? user;
    UserCred? userCred;

    on<AuthenticationEvent>((event, emit) {});

    on<GoogleSignInInitiatedEvent>((event, emit) {
      //the configuration for setting up sign in using google functionality

      emit(AuthenticationRequestedState());

      final FirebaseAuth auth = FirebaseAuth.instance;

      Future<void> signup() async {
        final GoogleSignIn googleSignIn = GoogleSignIn();
        final GoogleSignInAccount? googleSignInAccount =
            await googleSignIn.signIn();
        //checks weather the signup using google was successful or not
        if (googleSignInAccount != null) {
          final GoogleSignInAuthentication googleSignInAuthentication =
              await googleSignInAccount.authentication;
          final AuthCredential credential = GoogleAuthProvider.credential(
            accessToken: googleSignInAuthentication.accessToken,
            idToken: googleSignInAuthentication.idToken,
          );
          final userCredentials = await auth.signInWithCredential(credential);
          user = userCredentials.user;
          userCred = UserCred(
              id: user?.uid, name: user?.displayName, email: user?.email);
          log(userCred!.name.toString());
        } else {
          emit(AuthenticationErrorState(error: "Error while trying to log in"));
        }
      }

      signup();

      if (user != null) {
        emit(AuthenticationSuccessfulState());
      } else {
        emit(AuthenticationErrorState(
            error: "Authentication error try after some time"));
      }
    });
  }
}
