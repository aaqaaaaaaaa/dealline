import 'package:flutter/material.dart';

import 'package:dealline/styles/styles.dart';

import '../widgets/dropdwonButton.dart';

void showDialogOtpravit(BuildContext context) => showDialog(
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
                      Image.asset('assets/images/dialog_icons/Отправить.png'),
                      const SizedBox(
                        width: 12,
                      ),
                      const Text(
                        'Отправить',
                        style: TextStyle(
                            color: textColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 48, right: 16.0, top: 30),
                  child: Row(
                    children: [
                      Image.asset('assets/images/dialog_icons/Отправить документы.png'),
                     SizedBox(width: 17,),
                     Text('Отправить документы?',style: TextStyle(
                       color: textColor,
                       fontSize: 10,
                       fontWeight: FontWeight.w600
                     ),)
                      // const DDBWidget(),

                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18.0),
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
                              'Нет',
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
                                    borderRadius: BorderRadius.circular(8)))),
                        onPressed: () {
                          Navigator.pop(context);
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => const Brands(),
                          //     ));
                        },
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 34.0),
                          child: Text(
                            'Да',
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
