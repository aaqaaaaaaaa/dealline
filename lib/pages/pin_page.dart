import 'package:dealline/pages/menu_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:collection/equality.dart' show IterableEquality;

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  _PinPageState createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  int index = 0;
  List listAddPin = [];
  List listPin = [1, 1, 1, 1];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // keyboardBorder(),

            Image.asset('assets/images/keyboardPageTitle.png'),
            pinCircle(),
            const SizedBox(
              height: 72,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 63),
              decoration: BoxDecoration(
                gradient: RadialGradient(colors: [
                  primaryColor,
                  // backgroundColor,
                  Colors.grey.withOpacity(0.0),
                ]),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 3.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeyboard(id: 1),
                        buttonKeyboard(id: 2),
                        buttonKeyboard(id: 3),
                      ],
                    ),
                  ),
                  // Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeyboard(id: 4),
                        buttonKeyboard(id: 5),
                        buttonKeyboard(id: 6)
                      ],
                    ),
                  ),
                  // Image.asset('assets/images/row.png',
                  //     width: MediaQuery.of(context).size.width * 2),
//             Container(
//               height: 3,
// margin: EdgeInsets.symmetric(horizontal: 30),
//               decoration:  const BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [
//                     Color(0xffC4C4C4),
//                     primaryColor,
//                     Color(0xffC4C4C4),
//                   ],
//
//                 ),
//               ),
//             ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 3,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        buttonKeyboard(id: 7),
                        buttonKeyboard(id: 8),
                        buttonKeyboard(id: 9)
                      ],
                    ),
                  ),
                  // Divider(),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: 0.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 4.4,
                          color: backgroundColor,
                          child: buttonKeyboard(),
                        ),
                        buttonKeyboard(id: 0),
                        clearButton(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 0.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//
//                   buttonKeyboard(id: 1),
//                   buttonKeyboard(id: 2),
//                   buttonKeyboard(id: 3),
//                 ],
//               ),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 0.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buttonKeyboard(id: 4),
//                   buttonKeyboard(id: 5),
//                   buttonKeyboard(id: 6)
//                 ],
//               ),
//             ),
//             // Image.asset('assets/images/row.png',
//             //     width: MediaQuery.of(context).size.width * 2),
// //             Container(
// //               height: 3,
// // margin: EdgeInsets.symmetric(horizontal: 30),
// //               decoration:  const BoxDecoration(
// //                 gradient: LinearGradient(
// //                   colors: [
// //                     Color(0xffC4C4C4),
// //                     primaryColor,
// //                     Color(0xffC4C4C4),
// //                   ],
// //
// //                 ),
// //               ),
// //             ),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 0.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   buttonKeyboard(id: 7),
//                   buttonKeyboard(id: 8),
//                   buttonKeyboard(id: 9)
//                 ],
//               ),
//             ),
//             Divider(),
//             Padding(
//               padding: const EdgeInsets.only(bottom: 10.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     width: 80,
//                   ),
//                   buttonKeyboard(id: 0),
//                   clearButton(),
//                 ],
//               ),
//             ),
          ],
        ),
      ),
    );
  }

  Widget clearButton() {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width / 4.4, height: 80),
      child: ElevatedButton(
          child: Image.asset('assets/images/icons/clearIcon.png'),
          onLongPress: () {
            setState(() {
              index = 0;
              listAddPin.clear();
            });
          },
          onPressed: () {
            setState(() {});
            if (index > 0) {
              listAddPin.remove(listAddPin.last);
              index--;
            }
            debugPrint('$index');
          },
          style: keyboardButtonStyle),
    );
  }

  Widget pinCircle() {
    return Container(
      padding: const EdgeInsets.only(
        top: 42,
      ),
      width: MediaQuery.of(context).size.width / 3,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: index >= 1 ? primaryColor : pinColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: pinColor,
                width: 5,
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: index >= 2 ? primaryColor : pinColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: pinColor,
                width: 5,
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: index >= 3 ? primaryColor : pinColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: pinColor,
                width: 5,
              ),
            ),
          ),
          Container(
            width: 20,
            height: 20,
            decoration: BoxDecoration(
              color: index == 4 ? primaryColor : pinColor,
              borderRadius: BorderRadius.circular(50),
              border: Border.all(
                color: pinColor,
                width: 5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buttonKeyboard({int? id}) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width / 4.4, height: 80),
      child: ElevatedButton(
        child: Text(
          id != null ? '$id' : '',
          style: const TextStyle(
            fontSize: 30,
            color: primaryColor,
          ),
        ),
        onPressed: () {
          setState(() {});
          if (index < 3) {
            listAddPin.add(id);
            index++;
          } else if (index >= 3) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MenuPage(),
                ));
          }
          trueFalse();

          debugPrint('$listAddPin');

          debugPrint('$index');
        },
        style: keyboardButtonStyle,
      ),
    );
  }

  void trueFalse() {
    if (index == 4) {
      var trFalse = const IterableEquality().equals(listAddPin, listPin);
      if (trFalse) {
        // showCupertinoDialog(
        //     context: context,
        //     builder: createAuthDialog); // showDialog('Authentication failed');

      } else {
        // showCupertinoDialog(
        //     context: context,
        //     builder:
        //     createAuthDialogError); // showDialog('Authentication failed');

      }
    }
  }
}
