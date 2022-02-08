import 'package:dealline/pages/brend_page/brends.dart';
import 'package:dealline/pages/menu_page/dialogs/cubit/market_cubit.dart';
import 'package:dealline/pages/menu_page/dialogs/data/data.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../widgets/dropdwonButton.dart';
class ShowDP extends StatelessWidget {
  const ShowDP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => MarketCubit(marketCubit: market_list),
  // child: DialogPlatit(context: context,),
);
  }
}
class DialogPlatit extends StatefulWidget {
   DialogPlatit({Key? key}) : super(key: key);
// BuildContext context;
  @override
  _DialogPlatitState createState() => _DialogPlatitState();
}

class _DialogPlatitState extends State<DialogPlatit> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Dialog(
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
        insetPadding:
        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
// titlePadding: EdgeInsets.all(0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 30,
              decoration: const BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12),
                      topLeft: Radius.circular(12))),
              child: Row(
                children: [
                  const SizedBox(
                    width: 20,
                  ),
                  Image.asset('assets/images/dialog_icons/Платить (2).png'),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Платить',
                    style: TextStyle(
                        color: textColor,
                        fontSize: 10,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 19, right: 16.0, top: 28, bottom: 13),
              child: Row(
                children: [
                  Image.asset('assets/images/icons/marketIcon.png'),
                   DDBWidget(),
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 19, right: 16.0, bottom: 13),
              child: TextFieldRow(
                prefixImageTExtField:
                'assets/images/icons/locationIcon.png',
                hinText: 'Регион',
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 19, right: 16.0, bottom: 13),
              child: TextFieldRow(
                prefixImageTExtField:
                'assets/images/dialog_icons/Задолженность2.png',
                hinText: 'Задолженность',
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.only(left: 19, right: 16.0, bottom: 13),
              child: TextFieldRow(
                prefixImageTExtField:
                'assets/images/dialog_icons/Cумма к оплате2.png',
                hinText: 'Cумма к оплате',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 28.0, left: 19),
              child: Container(
                  height: 37,
                  width: MediaQuery.of(context).size.width / 1.33,
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: textFieldFillColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextField(
                    cursorColor: textColor,
                    style: textStyle,
                    maxLines: 3,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent, width: 0.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.transparent, width: 0.0),
                      ),
                      filled: true,
                      fillColor: Colors.transparent,
                      // fillColor: textFieldFillColor,
                      // prefixIcon: Image.asset('${widget.prefixImageTExtField}'),
                      border: InputBorder.none,
                      hintText: 'Комментария...',
                      hintStyle: textStyle,
                      // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                      style:dialogButtonStyle,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        'Назад',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                            fontSize: 12),
                      )),
                  ElevatedButton(
                    style:dialogButtonStyle,
                    onPressed: () {
                      Navigator.pop(context);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const Brands(),
                      //     ));
                    },
                    child: Text(
                      'Платить',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showDialogPlatit(BuildContext context) => showDialog(
    context: context,
    builder: (context) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Dialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
// contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            insetPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
// titlePadding: EdgeInsets.all(0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 30,
                  decoration: const BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(12),
                          topLeft: Radius.circular(12))),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Image.asset('assets/images/dialog_icons/Платить (2).png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Платить',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 19, right: 16.0, top: 28, bottom: 13),
                  child: Row(
                    children: [
                      Image.asset('assets/images/icons/marketIcon.png'),
                      const DDBWidget(),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 19, right: 16.0, bottom: 13),
                  child: TextFieldRow(
                    prefixImageTExtField:
                        'assets/images/icons/locationIcon.png',
                    hinText: 'Регион',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 19, right: 16.0, bottom: 13),
                  child: TextFieldRow(
                    prefixImageTExtField:
                        'assets/images/dialog_icons/Задолженность2.png',
                    hinText: 'Задолженность',
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 19, right: 16.0, bottom: 13),
                  child: TextFieldRow(
                    prefixImageTExtField:
                        'assets/images/dialog_icons/Cумма к оплате2.png',
                    hinText: 'Cумма к оплате',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 28.0, left: 19),
                  child: Container(
                      height: 37,
                      width: MediaQuery.of(context).size.width / 1.33,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      decoration: BoxDecoration(
                        color: textFieldFillColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextField(
                        cursorColor: textColor,
                        style: textStyle,
                        maxLines: 3,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.transparent, width: 0.0),
                          ),
                          filled: true,
                          fillColor: Colors.transparent,
                          // fillColor: textFieldFillColor,
                          // prefixIcon: Image.asset('${widget.prefixImageTExtField}'),
                          border: InputBorder.none,
                          hintText: 'Комментария...',
                          hintStyle: textStyle,
                          // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
                        ),
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style:dialogButtonStyle,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text(
                            'Назад',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          )),
                      ElevatedButton(
                        style:dialogButtonStyle,
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Brands(),
                          //     ));
                        },
                        child: Text(
                          'Платить',
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
