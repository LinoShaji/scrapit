import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scrapit/color_scheme/material3/color_schemes.g.dart';
import 'package:scrapit/pages/authentication_page/bloc/authentication_bloc.dart';
import 'package:scrapit/pages/authentication_page/ui/authentication_page.dart';

void main() async {
  await dotenv.load();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final HttpLink link = HttpLink(
        'https://grateful-turtle-92.hasura.app/v1/graphql',
        defaultHeaders: {
          'x-hasura-admin-secret':
              '4K3jLfXMz2jTUUnkI1OAZh5HgHHE3N0m605NZW3L4A0v8SffxI2wxeiZvP5D0QDR'
        });
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: link,
        cache: GraphQLCache(),
      ),
    );

    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthenticationBloc>(
              create: (BuildContext context) => AuthenticationBloc())
        ],
        child: MaterialApp(
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: lightColorScheme,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorScheme: darkColorScheme,
          ),
          home: GraphQLProvider(
            client: client,
            child: const AuthenticationPage(),
          ),
        ));
  }
}
