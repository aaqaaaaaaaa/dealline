import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 230,
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  'assets/images/settings_app_bar.png',
                ),
                fit: BoxFit.fitWidth,
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    width: 110,
                    height: 110,
                    child: Image.asset('assets/images/avatar.png'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 44.0,top: 53),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Image.asset('assets/images/ic_lock.png'),
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Изменить пароль',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Image.asset('assets/images/ic_info.png'),
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'О программе',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                      TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                child: Image.asset('assets/images/ic_logout.png'),
                                height: 25,
                                width: 25,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                'Выйти',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          )),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
