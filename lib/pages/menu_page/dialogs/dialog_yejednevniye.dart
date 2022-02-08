
import 'package:dealline/pages/menu_page/otchyot_page.dart';
import 'package:flutter/material.dart';
import 'package:dealline/styles/styles.dart';

import 'dialog_otpravit.dart';
import 'search_dialog/zakazatDialog.dart';

const values = [
  'Отчёт по бренду',
  'Ежедневные отчёты',
];
String selectedValue = values.first;

class buildRadiusTwo extends StatefulWidget {
  const buildRadiusTwo({Key? key}) : super(key: key);

  @override
  _buildRadiusTwoState createState() => _buildRadiusTwoState();
}

class _buildRadiusTwoState extends State<buildRadiusTwo> {
  //
  // @override
  // void initState() {
  //   showDialogOtchyoti(context);
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: values
          .map((value) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: SizedBox(
                  height: 45,
                  child: RadioListTile<String>(
                      activeColor: textColor,
                      value: value,
                      title: Text(
                        value,
                        style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      ),
                      groupValue: selectedValue,
                      onChanged: (value) => setState(() {
                            selectedValue = value.toString();
                          })),
                ),
              ))
          .toList(),
    );
  }
}

void showDialogYejednevniye(BuildContext context) => showDialog(
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
                      Image.asset(
                          'assets/images/dialog_icons/Ежедневные отчёты.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Ежедневные отчёты',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: buildRadiusTwo(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 21.0),
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
                        style: dialogButtonStyle,
                        onPressed: () {
                          Navigator.pop(context);
                          if (selectedValue == values.first) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => OtchyotPage(),));
                          } else if (selectedValue == values.last) {
                            showDialog(
                                context: context,
                                builder: (context) => DialogZ());
                          } else {
                            // showDialogZakazat(context);
                            Navigator.pop(context);
                          }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Brands(),
                          //     ));
                        },
                        child: Text(
                          'Далее',
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
