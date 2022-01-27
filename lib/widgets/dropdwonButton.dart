import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';

const textStyle = TextStyle(
  fontSize: 8,
  color: textColor,
  fontWeight: FontWeight.w600,
);

class DDBWidget extends StatefulWidget {
  const DDBWidget({Key? key}) : super(key: key);

  @override
  State<DDBWidget> createState() => _DDBWidgetState();
}

class _DDBWidgetState extends State<DDBWidget> {
  List items = [
    // for(int i = 0; i < 5; i++){
    'Магазин 1',
    'Магазин 2',
    'Магазин 3',
    'Магазин 4',
    'Магазин 5',
    // }
  ];
  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      padding: const EdgeInsets.only(
        left: 10,
      ),
      margin: const EdgeInsets.only(
        left: 17,
      ),
      decoration: BoxDecoration(
        color: textFieldFillColor,
        border: Border.all(color: textFieldFillColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: DropdownButton<String>(
          dropdownColor: textFieldFillColor,
          focusColor: textFieldFillColor,
          isExpanded: true,
          underline: const SizedBox(),
          hint: const Text(
            'Магазин',
            style: TextStyle(
                fontSize: 8, color: textColor, fontWeight: FontWeight.w600),
          ),
          iconSize: 16,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Colors.black,
          ),
          value: valueChoose,
          onChanged: (newValue) {
            setState(() {
              valueChoose = newValue;
            });
          },
          items: items.map((valueItem) {
            return DropdownMenuItem<String>(
              value: valueItem,
              child: Text(
                valueItem,
                style: textStyle,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class TextFieldRow extends StatefulWidget {
  const TextFieldRow({
    Key? key,
    required this.prefixImageTExtField,
    required this.hinText,
  }) : super(key: key);
  final String prefixImageTExtField;
  final String hinText;

  @override
  _TextFieldRowState createState() => _TextFieldRowState();
}

class _TextFieldRowState extends State<TextFieldRow> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('${widget.prefixImageTExtField}'),
        const SizedBox(
          width: 17,
        ),
        Container(
            width: MediaQuery.of(context).size.width / 1.5,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              cursorColor: textColor,
              style: textStyle,
              decoration: InputDecoration(
                filled: true,
                fillColor: textFieldFillColor,
                // prefixIcon: Image.asset('${widget.prefixImageTExtField}'),
                border: InputBorder.none,
                hintText: '${widget.hinText}',
                hintStyle: textStyle,
                // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
              ),
            )),
      ],
    );
  }
}
