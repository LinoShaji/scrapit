import 'package:dartz/dartz.dart';
import 'package:scrapit/core/errors/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/data/data_sources/remote_data_surces.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/domain/repositories/auth_repositories.dart';

class AuthRepoImpl implements AuthRepository {

  final dataSource = FirebaseAuthDataSource();
  
  @override
  Future<Either<UserCredential, Failure>> signinWithGoogle() async {
    try {
      final user = await dataSource.googleSignIn();
      return Left(user);
    } catch (error) {
      return Right(
        GoogleSignInFailure(
          message: error.toString(),
        ),
      );
    }
  }

  Future<Either<bool, Failure>> userSignOut() async {
    try {
      dataSource.userSignOut();
      return left(true);
    } catch (error) {
      return Right(
        SignOutFailure(
          message: error.toString(),
        ),
      );
    }
  }
}
