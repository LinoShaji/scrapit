import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/presentation/cubit/cubit/authentication_cubit.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final GoogleSignInUseCase googleSignInUseCase;
    return Scaffold(
      body: FilledButton(
          onPressed: () {
            context.read<AuthenticationCubit>().authenticateUser("id", "password");
          },
          child: const Text("press for authentication")),
    );
  }
}
