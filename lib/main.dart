import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrapit/color_scheme/material3/color_schemes.g.dart';
import 'package:scrapit/pages/authentication_page/bloc/authentication_bloc.dart';
import 'package:scrapit/pages/authentication_page/ui/authentication_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
          home: const AuthenticationPage(),
        ));
  }
}
