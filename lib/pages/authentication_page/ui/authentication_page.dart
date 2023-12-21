import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/authentication_bloc.dart';
import '../widgets/logo.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthenticationBloc>();

    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthenticationRequestedState) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
        if (state is AuthenticationSuccessfulState) {
          return const Scaffold(
            body: Text("Authentication successful state"),
          );
        }
        if (state is AuthenticationErrorState) {
          return Scaffold(
            body: Center(
              child: Text(
                  "Authentication is error and the error was ${state.error}"),
            ),
          );
        }
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 02),
                  const Center(
                    child: Logo(),
                  ),
                  FilledButton(
                    onPressed: () {
                      bloc.add(GoogleSignInInitiatedEvent());
                    },
                    child: const Text("Signin using google"),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
