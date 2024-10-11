import 'package:equatable/equatable.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/domain/entites/user.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({this.user});
  final User? user;
  @override
  List<Object?> get props => [];

  AuthenticationState copyWith({
    User? user,
  }) {
    return AuthenticationState(user: user ?? this.user);
  }
}
