import 'package:dealline/pages/brend_page/brends.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/dropdwonButton.dart';
import 'package:flutter/material.dart';



void showDialogZakazat(BuildContext context) => showDialog(
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
                Image.asset('assets/images/icons/ic_buy.png'),
                const SizedBox(
                  width: 12,
                ),
                const Text(
                  'Заказать',
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
            const EdgeInsets.only(left: 16, right: 16.0, top: 30,bottom: 13),
            child: Row(
              children: [
                Image.asset('assets/images/icons/marketIcon.png'),
                const DDBWidget(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16.0,
            ),
            child: TextFieldRow(
              prefixImageTExtField:
              'assets/images/icons/locationIcon.png',
              hinText: 'Регион',
            ),
          ),
          SizedBox(height: 27,),
          Padding(
            padding: const EdgeInsets.only(bottom: 19.0),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>  BrandPage(),
                        ));
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
  ),
);

