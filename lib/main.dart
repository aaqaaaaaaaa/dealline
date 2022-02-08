import 'package:dealline/pages/brend_page/brends.dart';
import 'package:dealline/pages/login/authentification_page.dart';
import 'package:dealline/pages/category_page/category_page.dart';
import 'package:dealline/pages/menu_page/menu_page.dart';
import 'package:dealline/pages/product_item_screen/element_card_widget_in_hero.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
final String FAVORITE_BOX = 'Favorite_Box';
final String PIN_BOX = 'PIN_Box';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox(FAVORITE_BOX);
  // await Hive.openBox(PIN_BOX);
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
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
        home: MenuPage()
        // AuthPage(),
        );
  }
}
