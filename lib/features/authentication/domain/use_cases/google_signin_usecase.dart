import 'package:dartz/dartz.dart';
import 'package:scrapit/core/errors/failure.dart';
import 'package:scrapit/core/use_case/use_case.dart';
import 'package:scrapit/features/authentication/domain/entites/user.dart';
import 'package:scrapit/features/authentication/domain/repositories/auth_repositories.dart';

class GoogleSignInUseCase implements UseCase<User, NoParams> {
  final AuthRepository repository;

  GoogleSignInUseCase(this.repository);

  @override
  Future<Either<User, Failure>> call(NoParams params) async {
    return await repository.signinWithGoogle();
  }
}
