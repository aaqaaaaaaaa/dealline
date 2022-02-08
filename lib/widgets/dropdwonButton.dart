import 'package:dealline/pages/menu_page/dialogs/search_dialog/search_dialog_widget.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pages/menu_page/dialogs/cubit/market_cubit.dart';

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

  String? valueChoose;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
  builder: (context, state) {
    return Container(
      height: 19,
      width: MediaQuery.of(context).size.width / 1.5,
      // padding: const EdgeInsets.only(
      //   left: 10,
      // ),
      margin: const EdgeInsets.only(
        left: 17,
      ),
      decoration: BoxDecoration(
        color: textFieldFillColor,
        border: Border.all(color: textFieldFillColor),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child:     Container(
            // height: 29,
            width: MediaQuery.of(context).size.width / 1.5,
            // padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical(y: 1),
              cursorColor: textColor,
              style: textStyle,
              decoration: InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                fillColor: textFieldFillColor,
                // prefixIcon: Image.asset('${widget.prefixImageTExtField}'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                      color: Colors.white,
                    )),

                hintText: '${BlocProvider.of<MarketCubit>(context).state.title}',
                hintStyle: textStyle,
                // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
              ),
              onTap: ()=> showDialog(context: context, builder: (_)=>SearchDialogWidget()),
              readOnly: true,
            )),
        // DropdownButton<String>(
        //   dropdownColor: textFieldFillColor,
        //   focusColor: textFieldFillColor,
        //   isExpanded: true,
        //   underline: const SizedBox(),
        //   hint: const Text(
        //     'Магазин',
        //     style: TextStyle(
        //         fontSize: 8, color: textColor, fontWeight: FontWeight.w600),
        //   ),
        //   iconSize: 16,
        //   icon: const Icon(
        //     Icons.arrow_drop_down,
        //     color: Colors.black,
        //   ),
        //   value: valueChoose,
        //   onChanged: (newValue) {
        //     setState(() {
        //       valueChoose = newValue;
        //     });
        //   },
        //   items: items.map((valueItem) {
        //     return
        //       DropdownMenuItem<String>(
        //       value: valueItem,
        //       child: Text(
        //         valueItem,
        //         style: textStyle,
        //       ),
        //     );
        //   }).toList(),
        // ),
      ),
    );
  },
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
        Container(
            width: 16,
            child: Image.asset('${widget.prefixImageTExtField}')),
        const SizedBox(
          width: 17,
        ),
        Container(
            height: 29,
            width: MediaQuery.of(context).size.width / 1.5,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              textAlignVertical: TextAlignVertical(y: 1),
              cursorColor: textColor,
              style: textStyle,
              decoration: InputDecoration(
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent, width: 0.0),
                ),
                fillColor: textFieldFillColor,
                // prefixIcon: Image.asset('${widget.prefixImageTExtField}'),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(
                      width: 0.0,
                      style: BorderStyle.none,
                      color: Colors.white,
                    )),
                hintText: '${widget.hinText}',
                hintStyle: textStyle,
                // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
              ),
            )),
      ],
    );
  }
}
