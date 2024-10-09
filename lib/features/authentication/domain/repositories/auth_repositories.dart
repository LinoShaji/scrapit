import 'package:dartz/dartz.dart';
import 'package:scrapit/core/errors/failure.dart';
import 'package:scrapit/features/authentication/domain/entites/user.dart'
    as scrap;

abstract class AuthRepository {
  Future<Either<scrap.User, Failure>> signinWithGoogle();
}
