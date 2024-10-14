import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/presentation/cubit/cubit/authentication_cubit.dart';
import 'package:scrapit/features/authentication_and_user_details_fetching/presentation/pages/authentication_page.dart';

void main() {
  runApp(const Quest());
}

class Quest extends StatelessWidget {
  const Quest({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'quest',
      home: Redirect(),
    );
  }
}

class  Redirect extends StatelessWidget {
  const Redirect ({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: setupblocProviders(),
      child: const AuthenticationPage(),
    );
  }
}

List<BlocProvider> setupblocProviders() {
  return [
    BlocProvider<AuthenticationCubit>(
      create: (context) => AuthenticationCubit(),
    )
  ];
}
