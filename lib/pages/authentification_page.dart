import 'package:dealline/pages/pin_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthentificationPage extends StatefulWidget {
  const AuthentificationPage({Key? key}) : super(key: key);

  @override
  _AuthentificationPageState createState() => _AuthentificationPageState();
}

class _AuthentificationPageState extends State<AuthentificationPage> {
  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 47),
        color: backgroundColor,
        child: Center(
          child: Column(
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
                  style: const TextStyle(fontSize: 11),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: Color(0xff989898),
                      fontSize: 11,
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
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
                  obscureText: visiblePassword,
                  obscuringCharacter: '•',
                  style: const TextStyle(fontSize: 11),
                  cursorColor: Colors.grey,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      color: Color(0xff989898),
                      fontSize: 11,
                    ),
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    hintText: 'Пароль',
                    iconColor: Colors.grey,
                    prefixIcon: Image.asset('assets/images/icons/ic_password.png',
                        width: 16, height: 16),
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
                      backgroundColor: MaterialStateProperty.all(primaryColor)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PinPage(),
                        ));
                  },
                  child: const Text(
                    'Войти',
                    style: TextStyle(color: textColor),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
