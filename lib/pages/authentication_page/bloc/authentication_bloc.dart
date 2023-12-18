import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

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
  }
}
