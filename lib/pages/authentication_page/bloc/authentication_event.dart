part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class GoogleSignInInitiatedEvent extends AuthenticationEvent {}
