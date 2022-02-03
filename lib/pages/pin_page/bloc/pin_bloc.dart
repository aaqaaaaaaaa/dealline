import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dealline/pages/menu_page/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'pin_event.dart';

part 'pin_state.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  PinBloc(BuildContext context) : super(PinInitial()) {
    on<OnPressedEvent>((event, emit) {
      // ignore: unnecessary_type_check
      if (event is OnPressedEvent) {
        saveShared(pinPutController: event.pinController);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuPage(),
            ));
      }
    });
    // on<OnPressedClearEvent>((event, emit) =>  )
  }

  Future saveShared({required TextEditingController pinPutController}) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('pin_code', pinPutController.text);
    print('SHARED${sharedPreferences.get('pin_code')}');
  }
}
