import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:scrapit/data/authentication/authentication_data.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController mailEditingController = TextEditingController();
  TextEditingController locationEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();

  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetUserCredEvent>((event, emit) async {
      QueryResult result = await event.client.query(
        QueryOptions(
          document: gql(authenticationData.getUserCred),
        ),
      );
      log(result.toString());
    });
  }
}
