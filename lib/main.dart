import 'package:dealline/pages/brend_page/brends.dart';
import 'package:dealline/pages/login/authentification_page.dart';
import 'package:dealline/pages/category_page/category_page.dart';
import 'package:dealline/pages/product_item_screen/element_card_widget_in_hero.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
        primarySwatch: Colors.amber,
      ),
      home: BrandPage()
      // AuthPage(),
    );
  }
}
