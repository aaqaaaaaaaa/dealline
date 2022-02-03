part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class OnButtonPressedEvent extends LoginEvent {
  final TextEditingController phoneController;
  final TextEditingController passwordController;

  OnButtonPressedEvent({
    required this.phoneController,
    required this.passwordController,
  });
}
