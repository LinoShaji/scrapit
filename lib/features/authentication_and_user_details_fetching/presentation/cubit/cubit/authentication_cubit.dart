import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:scrapit/core/use_case/use_case.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/domain/use_cases/google_signin_usecase.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/presentation/cubit/cubit/authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationState> {
  final GoogleSignInUseCase googleSignInUseCase;
  AuthenticationCubit(this.googleSignInUseCase)
      : super(const AuthenticationState());

  void authenticateUser(String id, String password) async {
    log("entered the function");
    final result = await googleSignInUseCase.call(NoParams());
  }
}
