import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class OtchyotPage extends StatefulWidget {
  const OtchyotPage({Key? key}) : super(key: key);

  @override
  _OtchyotPageState createState() => _OtchyotPageState();
}

class _OtchyotPageState extends State<OtchyotPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              height: 176,
              width: MediaQuery.of(context).size.width,
              child: Container(
                height: 176,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(
                    'assets/images/settings_app_bar.png',
                  ),
                  fit: BoxFit.fill,
                )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                  onPressed: () => Navigator.pop(context),
                                  icon: Image.asset(
                                      'assets/images/icons/navigator_pop_icon.png')),
                              Text(
                                'Меню',
                                style: TextStyle(
                                    color: Color(0xff2d2d2d), fontSize: 13),
                              ),
                              // Expanded(child: Card()),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 17),
                            child: Image.asset(
                                'assets/images/icons/poopup_menu.png'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 148,
              child: Container(
                width: MediaQuery.of(context).size.width,
// padding: EdgeInsets.symmetric(horizontal: 29),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xff424242),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Минимальная сумма',
                            maxLines: 2,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 21, vertical: 6),
                      decoration: BoxDecoration(
                        color: Color(0xff424242),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Максимальная сумма',
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 10,
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '0',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
