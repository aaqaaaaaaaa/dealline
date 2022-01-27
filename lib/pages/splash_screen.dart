import 'package:dealline/pages/authentification_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatorPage();
  }

  _navigatorPage() async {
    await Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: ((context) => const AuthentificationPage()),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        child: Center(
          child: Container(
            child: Image.asset('assets/images/splashScreenTitle.png'),
          ),
        ),
      ),
    );
  }
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor: primaryColor,
      // lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Center(
        child: Image.asset('assets/images/splashScreenTitle.png'),
      ),
    );
  }
}
