part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationState {}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationRequestedState extends AuthenticationState {}

class AuthenticationSuccessfulState extends AuthenticationState {}

class AuthenticationErrorState extends AuthenticationState {
  final String error;
  AuthenticationErrorState({required this.error});
}
