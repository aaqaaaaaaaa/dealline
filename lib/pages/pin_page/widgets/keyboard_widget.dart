import 'package:dealline/pages/menu_page/menu_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NumPad extends StatefulWidget {
   NumPad({Key? key,required this.pinPutController}) : super(key: key);
  TextEditingController pinPutController= TextEditingController();

  @override
  State<NumPad> createState() => _NumPadState();
}

class _NumPadState extends State<NumPad> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width / 6.6),
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [
          primaryColor,
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
                clearButton(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget clearButton(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints.tightFor(
          width: MediaQuery.of(context).size.width / 4.4, height: 80),
      child: ElevatedButton(
          child: Image.asset('assets/images/icons/clearIcon.png'),
          onPressed: () {
            setState(() {});
            if (widget.pinPutController.text.isNotEmpty) {
              widget.pinPutController.text = widget.pinPutController.text
                  .substring(0, widget.pinPutController.text.length - 1);
              widget.pinPutController.selection = TextSelection.collapsed(
                  offset: widget.pinPutController.text.length);
            }
            // debugPrint('$index');
          },
          style: keyboardButtonStyle),
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
          widget.pinPutController.text = '${widget.pinPutController.text}$id';
          widget.pinPutController.selection =
              TextSelection.collapsed(offset: widget.pinPutController.text.length);
        },
        // trueFalse();

        // debugPrint('$listAddPin');

        // debugPrint('$index');

        style: keyboardButtonStyle,
      ),
    );
  }
}
