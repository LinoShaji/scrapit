import 'package:dartz/dartz.dart';
import 'package:scrapit/core/errors/failure.dart';
import 'package:scrapit/features/authentication/data/data_sources/remote_data_surces.dart';
import 'package:scrapit/features/authentication/domain/repositories/auth_repositories.dart';
import 'package:scrapit/features/authentication/domain/entites/user.dart'
    as scrap;

class AuthRepoImpl implements AuthRepository {
  final FirebaseAuthDataSource dataSource;
  AuthRepoImpl(this.dataSource);

  @override
  Future<Either<scrap.User, Failure>> signinWithGoogle() async {
    try {
      final user = await dataSource.googleSignIn();
      return Left(user);
    } catch (error) {
      return Right(GoogleSignInFailure(message: error.toString()));
    }
  }
}
