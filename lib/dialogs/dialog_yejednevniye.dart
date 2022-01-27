import 'package:dealline/dialogs/dialog_otpravit.dart';
import 'package:dealline/dialogs/dialog_platit.dart';
import 'package:dealline/dialogs/zakazatDialog.dart';
import 'package:flutter/material.dart';
import 'package:dealline/styles/styles.dart';

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
      mainAxisSize: MainAxisSize.min,
      children: values
          .map((value) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 38.0),
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
                  padding: const EdgeInsets.only(top: 20.0),
                  child: buildRadiusTwo(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(primaryColor),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 34.0),
                            child: Text(
                              'Назад',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12),
                            ),
                          )),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(primaryColor),
                          shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          if (selectedValue == values.first) {
                            showDialogOtpravit(context);
                          } else if (selectedValue == values.last) {
                            showDialogZakazat(context);
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
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.0),
                          child: Text(
                            'Далее',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                                fontSize: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
