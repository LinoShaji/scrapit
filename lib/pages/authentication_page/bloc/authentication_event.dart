part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {}

class GetUserCredEvent extends AuthenticationEvent {
  final GraphQLClient client;
  GetUserCredEvent({required this.client});
}
