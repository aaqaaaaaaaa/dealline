part of 'pin_bloc.dart';

@immutable
abstract class PinEvent {}

// ignore: must_be_immutable
class OnPressedEvent extends PinEvent {
  TextEditingController pinController = TextEditingController();
  OnPressedEvent({required this.pinController});
  // var sharedPreferences = SharedPreferences.getInstance();

// sharedPreferences.setString(
// 'pin_code', _pinPutController.text);

}

// OnPressedEvent(
//     {required int idButton,
//     required int index,
//     required List listPin,
//     required List listAddPin})
//     : super();

// ignore: must_be_immutable
class OnPressedClearEvent extends PinEvent {
  OnPressedClearEvent(
      {required int index,
      required int idButton,
      required List listPin,
      required List listAddPin})
      : super();
}
