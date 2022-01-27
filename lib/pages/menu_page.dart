import 'package:dealline/dialogs/dialog_otchyoti.dart';
import 'package:dealline/dialogs/dialog_otpravit.dart';
import 'package:dealline/dialogs/dialog_platit.dart';
import 'package:dealline/dialogs/zakazatDialog.dart';
import 'package:dealline/pages/brends.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/dropdwonButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        margin: const EdgeInsets.symmetric(horizontal: 60),
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
                        width: MediaQuery.of(context).size.width / 3.06,
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
                        width: MediaQuery.of(context).size.width / 3.06,
                        child: InkWell(
                          onTap: () => showDialogPlatit(context),
                          child: const MenuCard(
                              icon: 'assets/images/icons/platitIcon.png',
                              title: 'Платить'),
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20.0),
                  child: InkWell(
                    onTap: ()=> showDialogOtchyoti(context),
                    child: MenuCard(
                        icon: 'assets/images/icons/otchyotIcon.png',
                        title: 'Отчёты'),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 43,
                          width: MediaQuery.of(context).size.width / 2.9,
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
                                  child: const Center(
                                      child: Text(
                                    '2',
                                    style: TextStyle(
                                        fontSize: 7, color: primaryColor),
                                  )),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Container(
                          height: 43,
                          width: MediaQuery.of(context).size.width / 2.9,
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
                                  )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    InkWell(
                      onTap: () => showDialogOtpravit(context),

                      child: Container(
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
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3.06,
                        child: const MenuCard(
                            icon: 'assets/images/icons/zakazatIcon.png',
                            title: 'Настройка')),
                    const SizedBox(
                      width: 20,
                    ),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 3.06,
                        child: const MenuCard(
                            icon: 'assets/images/icons/ic_refresh.png',
                            title: 'Обновить')),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
//
// void showDialogWidget(BuildContext context) => showDialog(
//       context: context,
//       builder: (context) => Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 28.0),
//         child: Dialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//           // contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//           insetPadding:
//               const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
//           // titlePadding: EdgeInsets.all(0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: 30,
//                 decoration: const BoxDecoration(
//                     color: primaryColor,
//                     borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(12),
//                         topLeft: Radius.circular(12))),
//                 child: Row(
//                   children: [
//                     const SizedBox(
//                       width: 20,
//                     ),
//                     Image.asset('assets/images/icons/ic_buy.png'),
//                     const SizedBox(
//                       width: 12,
//                     ),
//                     const Text(
//                       'Заказать',
//                       style: TextStyle(
//                           color: textColor,
//                           fontSize: 10,
//                           fontWeight: FontWeight.w600),
//                     )
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding:
//                     const EdgeInsets.only(left: 16, right: 16.0, top: 30),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/images/icons/marketIcon.png'),
//                     const DDBWidget(),
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(
//                   left: 16,
//                   right: 16.0,
//                 ),
//                 child: TextFieldRow(
//                   prefixImageTExtField:
//                       'assets/images/icons/locationIcon.png',
//                   hinText: 'Регион',
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     ElevatedButton(
//                         style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(primaryColor),
//                           shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                         ),
//                         onPressed: () {
//                           Navigator.pop(context);
//                         },
//                         child: const Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 34.0),
//                           child: Text(
//                             'Назад',
//                             style: TextStyle(
//                                 color: Colors.black,
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 12),
//                           ),
//                         )),
//                     ElevatedButton(
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(primaryColor),
//                           shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(8)))),
//                       onPressed: () {
//                         Navigator.pop(context);
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => const Brands(),
//                             ));
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 34.0),
//                         child: Text(
//                           'Далее',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
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
            Image.asset(widget.icon),
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
