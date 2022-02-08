import 'package:dealline/pages/brend_page/brends.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/dropdwonButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/market_cubit.dart';
import 'data/data.dart';

class AktDialog extends StatelessWidget {
  const AktDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MarketCubit>(
        create: (context) => MarketCubit(marketCubit: market_list,title:market_list[0].dokon,region:market_list[0].region),
    child: Diallog());
  }
}

class Diallog extends StatefulWidget {
  const Diallog({Key? key}) : super(key: key);

  @override
  _DiallogState createState() => _DiallogState();
}

class _DiallogState extends State<Diallog> {
  var start, end;

  @override
  Widget build(BuildContext context) {
    start = dateTimeRange.start;
    end = dateTimeRange.end;
    return Container(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          // contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
          insetPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
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
                    Image.asset('assets/images/icons/ic_calendar.png'),
                    const SizedBox(
                      width: 12,
                    ),
                    const Text(
                      'Клиентская Акт-Сверка',
                      style: TextStyle(
                          color: textColor,
                          fontSize: 10,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16.0, top: 30),
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
                  prefixImageTExtField: 'assets/images/icons/locationIcon.png',
                  hinText: 'Регион',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 16,
                  right: 16.0,
                ),
                child: Row(
                    children: [
                      Image.asset('assets/images/icons/calendars_ic.png'),
                      const SizedBox(
                        width: 17,
                      ),
                      Container(
                        height: 29,
                        width: MediaQuery.of(context).size.width / 3.2,
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          onTap: () {
                            pickDateRange(context)
                                .then((value) => {setState(() {})});
                          },
                          readOnly: true,
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
                              ),
                            ),
                            hintText: '${start.year}/${start.month}/${start.day}',
                            hintStyle: textStyle,
                            // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
                          ),
                        ),
                      ),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: Text('-')),
                      Container(
                          height: 29,
                          width: MediaQuery.of(context).size.width / 3.2,
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            onTap: () {
                              pickDateRange(context)
                                  .then((value) => {setState(() {})});
                            },
                            readOnly: true,
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
                              hintText: '${end.year}/${end.month}/${end.day}',
                              hintStyle: textStyle,
                              // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
                            ),
                          )),
                    ],)
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BrandPage(),
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
  }
  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDataRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDateRange: dateTimeRange,
      lastDate: DateTime(2200),
    );
    if (newDataRange == null) return;

    setState(() {
      dateTimeRange = newDataRange;
    });
  }
}

DateTimeRange dateTimeRange =
    DateTimeRange(start: DateTime.now(), end: DateTime.now());
var start;
var end;

class TextFieldCalendarRow extends StatefulWidget {
  TextFieldCalendarRow({
    Key? key,
    required this.prefixImageTExtField,
    required this.hinText,
    required this.contextDialog,
    required this.hinText2,
  }) : super(key: key);
  final String prefixImageTExtField;
  String hinText;
  String hinText2;
  BuildContext contextDialog;

  @override
  _TextFieldCalendarRowState createState() => _TextFieldCalendarRowState();
}

class _TextFieldCalendarRowState extends State<TextFieldCalendarRow> {
  @override
  void setState(VoidCallback fn) {
    print('widget.hinText  ${widget.hinText}');
    super.setState(fn);
  }

  @override
  void initState() {
    print('widget.hinText  ${widget.hinText}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    start = dateTimeRange.start;
    end = dateTimeRange.end;
    return Row(
      children: [
        Image.asset('${widget.prefixImageTExtField}'),
        const SizedBox(
          width: 17,
        ),
        Container(
          height: 29,
          width: MediaQuery.of(context).size.width / 3.2,
          padding: const EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            onTap: () {
              pickDateRange(widget.contextDialog)
                  .then((value) => {print("tugadi")});
            },
            readOnly: true,
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
                ),
              ),
              hintText: '${widget.hinText}',
              hintStyle: textStyle,
              // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: Text('-')),
        Container(
            height: 29,
            width: MediaQuery.of(context).size.width / 3.2,
            padding: const EdgeInsets.symmetric(vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: TextField(
              onTap: () {
                pickDateRange(widget.contextDialog)
                    .then((value) => {setState(() {})});
              },
              readOnly: true,
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
                hintText: '${widget.hinText2}',
                hintStyle: textStyle,
                // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
              ),
            )),
      ],
    );
  }

  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDataRange = await showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDateRange: dateTimeRange,
      lastDate: DateTime(2200),
    );
    if (newDataRange == null) return;

    setState(() {
      dateTimeRange = newDataRange;
    });
  }
}
