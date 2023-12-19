import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scrapit/pages/authentication_page/widgets/custom_text_field.dart';

import '../bloc/authentication_bloc.dart';

class AuthenticationPage extends StatelessWidget {
  const AuthenticationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.watch<AuthenticationBloc>();
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Flexible(
                  child: Text(
                    "Enter your details and complete the authentication",
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Flexible(child: SizedBox(height: 250)),
                Column(
                  children: [
                    CustomAuthenticationTextField(
                        hintText: "name",
                        controller: bloc.nameTextEditingController),
                    FilledButton(
                      onPressed: () {
                        bloc.add(GetUserCredEvent(
                            client: GraphQLProvider.of(context).value));
                      },
                      child: const Text("click to get the users"),
                    )
                  ],
                )
              ]),
            ),
          ),
        );
      },
    );
  }
}
