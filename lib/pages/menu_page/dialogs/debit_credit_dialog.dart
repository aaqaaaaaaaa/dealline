import 'package:dealline/pages/brend_page/brends.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/dropdwonButton.dart';
import 'package:flutter/material.dart';

DateTimeRange dateTimeRange =DateTimeRange(start: DateTime.now(), end: DateTime.now());
var start = dateTimeRange.start;
var end = dateTimeRange.end;

class ShowDialogDebitKredit extends StatefulWidget {
  const ShowDialogDebitKredit({Key? key}) : super(key: key);

  @override
  _ShowDialogDebitKreditState createState() => _ShowDialogDebitKreditState();
}

class _ShowDialogDebitKreditState extends State<ShowDialogDebitKredit> {
  @override
  Widget build(BuildContext context) {
    var start = dateTimeRange.start;
    var end = dateTimeRange.end;

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
                  Image.asset('assets/images/icons/ic_calendar.png'),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    'Дебит кредит',
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
              const EdgeInsets.only(left: 16, right: 16.0, top: 30),
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
                'assets/images/icons/debit_ic1x.png',
                hinText: 'Группы товара',
              ),
            ), Padding(
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
    );
  }
  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDataRange= await  showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDateRange: dateTimeRange,
      lastDate: DateTime(2200),

    );
    if(newDataRange==null) return;
    else {
      setState(() =>
      dateTimeRange = newDataRange
      );
    }
  }
}
//
//
// void showDialogDebitKredit(BuildContext context) => showDialog(
//   context: context,
//   builder: (context) {
//
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 28.0),
//       child: Dialog(
//         shape:
//         RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         // contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//         insetPadding:
//         const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
//         // titlePadding: EdgeInsets.all(0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Container(
//               height: 30,
//               decoration: const BoxDecoration(
//                   color: primaryColor,
//                   borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(12),
//                       topLeft: Radius.circular(12))),
//               child: Row(
//                 children: [
//                   const SizedBox(
//                     width: 20,
//                   ),
//                   Image.asset('assets/images/icons/ic_calendar.png'),
//                   const SizedBox(
//                     width: 12,
//                   ),
//                   const Text(
//                     'Дебит кредит',
//                     style: TextStyle(
//                         color: textColor,
//                         fontSize: 10,
//                         fontWeight: FontWeight.w600),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding:
//               const EdgeInsets.only(left: 16, right: 16.0, top: 30),
//               child: Row(
//                 children: [
//                   Image.asset('assets/images/icons/marketIcon.png'),
//                   const DDBWidget(),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                 left: 16,
//                 right: 16.0,
//               ),
//               child: TextFieldRow(
//                 prefixImageTExtField:
//                 'assets/images/icons/debit_ic1x.png',
//                 hinText: 'Группы товара',
//               ),
//             ), Padding(
//                 padding: const EdgeInsets.only(
//                   left: 16,
//                   right: 16.0,
//                 ),
//                 child: Row(
//                   children: [
//                     Image.asset('assets/images/icons/calendars_ic.png'),
//                     const SizedBox(
//                       width: 17,
//                     ),
//                     Container(
//                       height: 29,
//                       width: MediaQuery.of(context).size.width / 3.2,
//                       padding: const EdgeInsets.symmetric(vertical: 5),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                       ),
//                       child: TextField(
//                         onTap: () {
//                           pickDateRange(context)
//                               .then((value) => {setState(() {})});
//                         },
//                         readOnly: true,
//                         textAlignVertical: TextAlignVertical(y: 1),
//                         cursorColor: textColor,
//                         style: textStyle,
//                         decoration: InputDecoration(
//                           filled: true,
//                           focusedBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.transparent, width: 0.0),
//                           ),
//                           enabledBorder: OutlineInputBorder(
//                             borderSide: BorderSide(color: Colors.transparent, width: 0.0),
//                           ),
//                           fillColor: textFieldFillColor,
//                           // prefixIcon: Image.asset('${widget.prefixImageTExtField}'),
//                           border: OutlineInputBorder(
//                             borderRadius: BorderRadius.circular(5),
//                             borderSide: BorderSide(
//                               width: 0.0,
//                               style: BorderStyle.none,
//                               color: Colors.white,
//                             ),
//                           ),
//                           hintText: '${start.year}/${start.month}/${start.day}',
//                           hintStyle: textStyle,
//                           // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
//                         ),
//                       ),
//                     ),
//                     Padding(padding: EdgeInsets.symmetric(horizontal: 6), child: Text('-')),
//                     Container(
//                         height: 29,
//                         width: MediaQuery.of(context).size.width / 3.2,
//                         padding: const EdgeInsets.symmetric(vertical: 5),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(5),
//                         ),
//                         child: TextField(
//                           onTap: () {
//                             pickDateRange(context)
//                                 .then((value) => {setState(() {})});
//                           },
//                           readOnly: true,
//                           textAlignVertical: TextAlignVertical(y: 1),
//                           cursorColor: textColor,
//                           style: textStyle,
//                           decoration: InputDecoration(
//                             filled: true,
//                             focusedBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.transparent, width: 0.0),
//                             ),
//                             enabledBorder: OutlineInputBorder(
//                               borderSide: BorderSide(color: Colors.transparent, width: 0.0),
//                             ),
//                             fillColor: textFieldFillColor,
//                             // prefixIcon: Image.asset('${widget.prefixImageTExtField}'),
//                             border: OutlineInputBorder(
//                                 borderRadius: BorderRadius.circular(5),
//                                 borderSide: BorderSide(
//                                   width: 0.0,
//                                   style: BorderStyle.none,
//                                   color: Colors.white,
//                                 )),
//                             hintText: '${end.year}/${end.month}/${end.day}',
//                             hintStyle: textStyle,
//                             // prefixIcon: Image.asset('assets/images/icons/locationIcon.png')),
//                           ),
//                         )),
//                   ],)
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   ElevatedButton(
//                       style: ButtonStyle(
//                         backgroundColor:
//                         MaterialStateProperty.all(primaryColor),
//                         shape: MaterialStateProperty.all(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                         ),
//                       ),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 34.0),
//                         child: Text(
//                           'Назад',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12),
//                         ),
//                       )),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                         backgroundColor:
//                         MaterialStateProperty.all(primaryColor),
//                         shape: MaterialStateProperty.all(
//                             RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8)))),
//                     onPressed: () {
//                       Navigator.pop(context);
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) =>  BrandPage(),
//                           ));
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 34.0),
//                       child: Text(
//                         'Далее',
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   },
// );


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
  Widget build(BuildContext context) {
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
          child:
          TextField(
            onTap: ()=>pickDateRange(widget.contextDialog),
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
              onTap: ()=>pickDateRange(widget.contextDialog),
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
    DateTimeRange? newDataRange= await  showDateRangePicker(
      context: context,
      firstDate: DateTime(1900),
      initialDateRange: dateTimeRange,
      lastDate: DateTime(2200),

    );
    if(newDataRange==null) return;
    else {
      setState(() =>
      dateTimeRange = newDataRange
      );
    }
  }
}
