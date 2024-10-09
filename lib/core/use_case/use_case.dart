import 'package:dartz/dartz.dart';
import 'package:scrapit/core/errors/failure.dart';

// UseCase base class
abstract class UseCase<Type, Params> {
  Future<Either<Type, Failure>> call(Params params);
}

// If no parameters are needed, this is used
class NoParams {}
