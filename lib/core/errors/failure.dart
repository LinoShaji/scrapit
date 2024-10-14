// core/errors/failure.dart

abstract class Failure {
  final String? message;
  const Failure({this.message});
}

// General Failures
class ServerFailure extends Failure {
  const ServerFailure({super.message});
}

class CacheFailure extends Failure {
  const CacheFailure({super.message});
}

// Auth-specific Failures
class AuthenticationFailure extends Failure {
  const AuthenticationFailure({super.message});
}

class SignOutFailure extends Failure {
  const SignOutFailure({super.message});
}

class GoogleSignInFailure extends Failure {
  const GoogleSignInFailure({super.message});
}

// Network Failures
class NetworkFailure extends Failure {
  const NetworkFailure({super.message});
}
