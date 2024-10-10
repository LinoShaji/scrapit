import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:scrapit/core/errors/failure.dart';
import 'package:scrapit/core/use_case/use_case.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/domain/repositories/auth_repositories.dart';

class GoogleSignInUseCase implements UseCase<firebase.UserCredential, NoParams> {
  final AuthRepository repository;

  GoogleSignInUseCase(this.repository);

  @override
  Future<Either<firebase.UserCredential, Failure>> call(NoParams params) async {
    return await repository.signinWithGoogle();
  }
}
