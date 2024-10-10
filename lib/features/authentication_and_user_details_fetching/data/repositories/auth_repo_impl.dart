import 'package:dartz/dartz.dart';
import 'package:scrapit/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/data/data_sources/remote_data_surces.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/domain/repositories/auth_repositories.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/domain/entites/user.dart'
    as scrap;

class AuthRepoImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;
  AuthRepoImpl(this.dataSource);

  @override
  Future<Either<UserCredential, Failure>> signinWithGoogle() async {
    try {
      final user = await dataSource.googleSignIn();
      return Left(user);
    } catch (error) {
      return Right(GoogleSignInFailure(message: error.toString()));
    }
  }
}
