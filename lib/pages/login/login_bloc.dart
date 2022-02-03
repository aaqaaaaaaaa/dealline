import 'package:bloc/bloc.dart';
import 'package:dealline/pages/pin_page/pin.dart';
import 'package:dealline/pages/pin_page/pin_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String phone = '123';
  String password = '123';

// BuildContext context;
  LoginBloc(BuildContext context) : super(LoginInitial()) {
    on<OnButtonPressedEvent>((event, emit) {
      if (event.phoneController.text == phone &&
          event.passwordController.text == password) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasswordScreen(),
            ));
      } else {
        Fluttertoast.showToast(
          msg: 'Логин или пароль неверно!',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          fontSize: 16,
        );
        event.passwordController.clear();
        event.phoneController.clear();
      }
    });
  }
}
