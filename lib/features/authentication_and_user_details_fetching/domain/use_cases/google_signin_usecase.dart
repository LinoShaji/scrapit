import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:scrapit/core/errors/failure.dart';
import 'package:scrapit/core/use_case/use_case.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/data/repository_impl/auth_repo_impl.dart';

class GoogleSignInUseCase
    implements UseCase<firebase.UserCredential, NoParams> {

  final repository = AuthRepoImpl();
  @override
  Future<Either<firebase.UserCredential, Failure>> call(NoParams params) async {
    return await repository.signinWithGoogle();
  }
}
