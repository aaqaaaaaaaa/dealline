import 'package:dealline/pages/favorites/favorite_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/bloc_card/card_grid_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../settings/settings_page.dart';
import 'dialogs/dialog_otchyoti.dart';
import 'dialogs/dialog_otpravit.dart';
import 'dialogs/dialog_platit.dart';
import 'dialogs/zakazatDialog.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width / 7),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/homePageTitle.png'),
                const SizedBox(
                  height: 47,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3.02,
                        child: InkWell(
                          onTap: () => showDialogZakazat(context),
                          child: const MenuCard(
                              icon: 'assets/images/icons/zakazatIcon.png',
                              title: 'Заказать'),
                        )),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3.02,
                        child: InkWell(
                          onTap: () => showDialogPlatit(context),
                          child: const MenuCard(
                              icon: 'assets/images/icons/platitIcon.png',
                              title: 'Платить'),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: 20.0,
                      horizontal: MediaQuery.of(context).size.width / 130),
                  child: InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) =>OtchyotDialog()),
                    child: MenuCard(
                        icon: 'assets/images/icons/otchyotIcon.png',
                        title: 'Отчёты'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        InkWell(
                          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage(),)),
                          child: Container(
                            height: 43,
                            width: MediaQuery.of(context).size.width / 2.95,
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              borderRadius:
                                  BorderRadius.only(topLeft: Radius.circular(8)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 11.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(child: Container()),
                                  Image.asset(
                                      'assets/images/icons/korzinaIcon.png'),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  const Text(
                                    'Заказы',
                                    style: TextStyle(
                                        color: textColor,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Expanded(child: Container()),
                                  Container(
                                    width: 10,
                                    height: 10,
                                    decoration: const BoxDecoration(
                                        color: textColor,
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(2),
                                          bottomLeft: Radius.circular(2),
                                        )),
                                    child:  Center(
                                        child: Text(
                                      '${CardList.length}',
                                      style: TextStyle(
                                          fontSize: 7, color: primaryColor),
                                    )),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height / 130,
                        ),
                        Container(
                          height: 43,
                          width: MediaQuery.of(context).size.width / 2.95,
                          decoration: const BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(8)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 11.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(child: Container()),
                                Image.asset(
                                    'assets/images/icons/platyojiIcon.png'),
                                const SizedBox(
                                  width: 8,
                                ),
                                const Text(
                                  'Платежи',
                                  style: TextStyle(
                                      color: textColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                                Expanded(child: Container()),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: const BoxDecoration(
                                      color: textColor,
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(2),
                                        bottomLeft: Radius.circular(2),
                                      )),
                                  child: const Center(
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.0),
                                      child: Text(
                                        '7',
                                        maxLines: 1,
                                        style: TextStyle(
                                            fontSize: 7, color: primaryColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 55,
                    ),
                    InkWell(
                      onTap: () => showDialogOtpravit(context),
                      child: Container(
                        width: MediaQuery.of(context).size.width / 2.95,
                        height: 91,
                        decoration: const BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.85,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/icons/ic_share.png'),
                              const SizedBox(height: 8),
                              const Text(
                                'Отправить',
                                style: TextStyle(
                                    color: textColor,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage(),));
                      },
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 3.02,
                        child: const MenuCard(
                          icon: 'assets/images/icons/settings_icon.png',
                          title: 'Настройка',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3.02,
                        child: InkWell(
                          onTap: (){
                            Fluttertoast.showToast(
                              msg: 'Обновлено!',
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              timeInSecForIosWeb: 1,
                              // backgroundColor: Colors.black,
                              fontSize: 16,
                            );
                          },
                          child: const MenuCard(
                              icon: 'assets/images/icons/ic_refresh.png',
                              title: 'Обновить'),
                        )),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

}

class RowWidget extends StatelessWidget {
  const RowWidget({Key? key, required this.imageTitle, required this.child})
      : super(key: key);
  final String imageTitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Image.asset(imageTitle),
          Container(
            child: child,
          )
        ],
      ),
    );
  }
}

class MenuCard extends StatefulWidget {
  const MenuCard({Key? key, required this.icon, required this.title})
      : super(key: key);
  final String icon;
  final String title;

  @override
  _MenuCardState createState() => _MenuCardState();
}

class _MenuCardState extends State<MenuCard> {
  final Color textColor = const Color(0xff2F2E2F);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 91,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 30, height: 30, child: Image.asset(widget.icon)),
            const SizedBox(height: 8),
            Text(
              widget.title,
              style: TextStyle(
                  color: textColor, fontSize: 12, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
