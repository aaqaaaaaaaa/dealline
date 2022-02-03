import 'package:dealline/pages/login/login_bloc.dart';
import 'package:dealline/pages/pin_page/pin_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context),
      child: AuthenticationPage(),
    );
  }
}

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  bool visiblePassword = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  Widget build(BuildContext context) {
    final LoginBloc loginBloc = LoginBloc(context);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 47),
        color: backgroundColor,
        child: Center(
          child: BlocBuilder<LoginBloc, LoginState>(
            bloc: loginBloc,
            builder: (context, LoginState state) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/voytiTitle.png',
                  ),
                  const SizedBox(
                    height: 39,
                  ),
                  Container(
                    height: 35,
                    // padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,

                    child: TextField(
                      autofocus: true,
                      focusNode: focusNode,
                      controller: phoneController,
                      textAlignVertical: TextAlignVertical(y: 1),
                      style: const TextStyle(fontSize: 11),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                        // filled: true,
                        // fillColor: Colors.white,

                        border: OutlineInputBorder(
                          // gapPadding: 20,
                          borderSide: BorderSide(
                              color: primaryColor,
                              style: BorderStyle.solid,
                              width: 0),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        hintStyle: const TextStyle(
                          color: Color(0xff989898),
                          fontSize: 11,
                        ),
                        focusColor: primaryColor,
                        hoverColor: primaryColor,
                        hintText: 'Логин',
                        iconColor: Colors.grey,
                        prefixIcon: Image.asset('assets/images/icons/phone.png',
                            width: 16, height: 16),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  Container(
                    height: 35,
                    // padding: EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    alignment: Alignment.center,

                    child: TextField(
                      controller: passwordController,
                      obscureText: visiblePassword,
                      obscuringCharacter: '•',
                      style: const TextStyle(fontSize: 11),
                      cursorColor: Colors.grey,
                      textAlignVertical: TextAlignVertical(y: 1),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8)),
                        hintStyle: const TextStyle(
                          color: Color(0xff989898),
                          fontSize: 11,
                        ),

                        focusColor: Colors.white,
                        hoverColor: Colors.white,
                        hintText: 'Пароль',
                        iconColor: Colors.grey,
                        prefixIcon: Image.asset(
                            'assets/images/icons/ic_password.png',
                            width: 16,
                            height: 16),
                        suffixIcon: IconButton(
                          onPressed: () => setState(() {
                            visiblePassword = !visiblePassword;
                          }),
                          icon: Icon(
                            visiblePassword
                                ? Icons.visibility_off_outlined
                                : Icons.remove_red_eye_outlined,
                            size: 16,
                            color: const Color(0xffBFBFBF),
                          ),
                        ),
                        // Image.asset(
                        //     'assets/images/visiblePasswordIcon.jpg',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(
                      style: ButtonStyle(
                          fixedSize: MaterialStateProperty.all(
                            const Size(187, 37),
                          ),
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor)),
                      onPressed: () {
                        focusNode.requestFocus();
                        loginBloc.add(OnButtonPressedEvent(
                            phoneController: phoneController,
                            passwordController: passwordController));
                      },
                      child: const Text(
                        'Войти',
                        style: TextStyle(color: textColor),
                      ))
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
