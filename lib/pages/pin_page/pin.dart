// import 'package:delline/screens/pass/components/num_pad.dart';
// import 'package:delline/screens/pass/pass_bloc/pass_bloc.dart';
// import 'package:delline/utils/app_colors.dart';
import 'package:dealline/pages/pin_page/bloc/pin_bloc.dart';
import 'package:dealline/pages/pin_page/widgets/keyboard_widget.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({Key? key}) : super(key: key);

  //
  // static Widget screen() => BlocProvider(
  //   create: (context) => PinBloc(context),
  //   child: const PasswordScreen(),
  // );

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  late PinBloc bloc;

  @override
  void initState() {
    bloc = PinBloc(context);
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  final TextEditingController _pinPutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 40,
                width: 181,
                child: Image.asset('assets/images/keyboardPageTitle.png'),
              ),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                width: 125,
                child: PinCodeTextField(
                  readOnly: true,
                  showCursor: false,
                  appContext: context,
                  controller: _pinPutController,
                  length: 4,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  obscuringWidget: Text(
                    '●',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 10,
                    ),
                  ),
                  enableActiveFill: true,
                  pinTheme: PinTheme(
                    fieldHeight: 20,
                    fieldWidth: 20,
                    borderWidth: 0,
                    shape: PinCodeFieldShape.circle,
                    activeColor: pinColor,
                    selectedColor: pinColor,
                    inactiveColor: pinColor,
                    disabledColor: pinColor,
                    activeFillColor: pinColor,
                    selectedFillColor: pinColor,
                    inactiveFillColor: pinColor,
                    errorBorderColor: pinColor,
                  ),
                  onCompleted: (value) {
                    bloc.add(OnPressedEvent(pinController: _pinPutController));
                  },
                  onChanged: (controllerPin) {},
                ),
              ),
              SizedBox(
                height: 56,
              ),
              NumPad(
                pinPutController: _pinPutController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
