import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scrapit/core/errors/failure.dart';

abstract class AuthRepository {
  Future<Either<UserCredential, Failure>> signinWithGoogle();
}
