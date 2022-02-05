import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dealline/pages/menu_page/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vibration/vibration.dart';

part 'pin_event.dart';

part 'pin_state.dart';

class PinBloc extends Bloc<PinEvent, PinState> {
  PinBloc(BuildContext context) : super(PinInitial()) {
    on<OnPressedEvent>((event, emit) async {
      // ignore: unnecessary_type_check
      if (event is OnPressedEvent) {
        var sharedPreferences = await SharedPreferences.getInstance();
        if (sharedPreferences.get('pin_code') != null) {
          if (sharedPreferences.get('pin_code') == event.pinController.text) {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MenuPage(),
                ));
          } else {
            print(' sdasdasdadasd  ${event.pinController.text}');
            event.pinController.clear();
            Vibration.vibrate(duration: 300);
            print(' sdasdasdadasd  ${event.pinController.text}');
            Fluttertoast.showToast(msg: 'Неправильный пин-код');
          }
        } else {
          saveShared(pinPutController: event.pinController);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MenuPage(),
            ),
          );
        }
      }
    });
    // on<OnPressedClearEvent>((event, emit) =>  )
  }

  Future saveShared({required TextEditingController pinPutController}) async {
    var sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString('pin_code', pinPutController.text);
    print('SHARED ${sharedPreferences.get('pin_code')}');
  }
}
