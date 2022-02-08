import 'package:dealline/pages/brend_page/brends.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/dropdwonButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:search_choices/search_choices.dart';

import '../cubit/market_cubit.dart';
import '../data/data.dart';
import 'search_dialog_widget.dart';

List<DropdownMenuItem<String>>? items;

String? selectedValueSingleDialog;

class DialogZ extends StatelessWidget {
  const DialogZ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => MarketCubit(
            marketCubit: market_list, title: 'Магазин', region: 'Регион'),
        child: DialogZakazat(
          contextZ: context,
        ));
  }
}

class DialogZakazat extends StatefulWidget {
  DialogZakazat({Key? key, required this.contextZ}) : super(key: key);
  BuildContext contextZ;

  @override
  _DialogZakazatState createState() => _DialogZakazatState();
}

class _DialogZakazatState extends State<DialogZakazat> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MarketCubit, MarketState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            insetPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
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
                      topLeft: Radius.circular(12),
                    ),
                  ),
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
                  padding: const EdgeInsets.only(
                      left: 16, right: 16.0, top: 30, bottom: 13),
                  child: Row(
                    children: [
                      Image.asset('assets/images/icons/marketIcon.png'),
                      Container(
                        height: 19,
                        width: MediaQuery.of(context).size.width / 1.5,
                        margin: const EdgeInsets.only(
                          left: 17,
                        ),
                        decoration: BoxDecoration(
                          color: textFieldFillColor,
                          border: Border.all(color: textFieldFillColor),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.5,
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
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.0),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.transparent, width: 0.0),
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
                                hintText: '${state.title ?? 'Магазин'}',
                                hintStyle: textStyle,
                              ),
                              onTap: () => showDialog(
                                context: context,
                                builder: (_) => BlocProvider.value(
                                  value: BlocProvider.of<MarketCubit>(context),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 28.0),
                                    child: Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      insetPadding: const EdgeInsets.symmetric(
                                          vertical: 20, horizontal: 0),
                                      // titlePadding: EdgeInsets.all(0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            // height: 22,
                                            margin: EdgeInsets.only(top: 20),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.4,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: TextField(
                                              autofocus: true,
                                              onChanged: (value) {
                                                BlocProvider.of<MarketCubit>(
                                                        context)
                                                    .searchMarket(value);
                                                print(value);
                                              },
                                              controller:
                                                  BlocProvider.of<MarketCubit>(
                                                          context)
                                                      .state
                                                      .filter,
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                suffixIcon: Icon(
                                                  Icons.search,
                                                ),
                                                hintText: 'Поиск...',
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 15),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.1,
                                            height: 300,
                                            child: BlocBuilder<MarketCubit,
                                                MarketState>(
                                              builder: (context, state) {
                                                return ListView.separated(
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          Divider(height: 1),
                                                  itemCount:
                                                      state.markets.length,
                                                  itemBuilder:
                                                      (context, index) {
                                                    final market =
                                                        state.markets[index];
                                                    return ListTile(
                                                        onTap: () {
                                                          BlocProvider.of<
                                                                      MarketCubit>(
                                                                  context)
                                                              .onSelected(
                                                                  index);
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        title: Text(
                                                            '${state.markets[index].dokon}'));
                                                  },
                                                );
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                      )
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
                    hinText:
                        '${BlocProvider.of<MarketCubit>(context).state.region ?? 'Регион'}',
                  ),
                ),
                SizedBox(
                  height: 27,
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 19.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          style: dialogButtonStyle,
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
                          debugPrint(BlocProvider.of<MarketCubit>(context)
                              .state
                              .region);
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
        );
      },
    );
  }
}

// void showDialogZakazat(BuildContext context) => showDialog(
//   context: context,
//   builder: (context) => Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 28.0),
//     child: Dialog(
//       shape:
//       RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       // contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
//       insetPadding:
//       const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
//       // titlePadding: EdgeInsets.all(0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Container(
//             height: 30,
//             decoration: const BoxDecoration(
//                 color: primaryColor,
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(12),
//                     topLeft: Radius.circular(12))),
//             child: Row(
//               children: [
//                 const SizedBox(
//                   width: 20,
//                 ),
//                 Image.asset('assets/images/icons/ic_buy.png'),
//                 const SizedBox(
//                   width: 12,
//                 ),
//                 const Text(
//                   'Заказать',
//                   style: TextStyle(
//                       color: textColor,
//                       fontSize: 10,
//                       fontWeight: FontWeight.w600),
//                 )
//               ],
//             ),
//           ),
//           Padding(
//             padding:
//             const EdgeInsets.only(left: 16, right: 16.0, top: 30,bottom: 13),
//             child: Row(
//               children: [
//                 Image.asset('assets/images/icons/marketIcon.png'),
//                  SearchChoices.single(
//                   items: items,
//                   value: selectedValueSingleDialog,
//                   hint: "Select one",
//                   searchHint: "Select one",
//                   onChanged: (value) {
//                     setState(() {
//                       selectedValueSingleDialog = value;
//                     });
//                   },
//                   isExpanded: true,
//                 ),
//               ],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               left: 16,
//               right: 16.0,
//             ),
//             child: TextFieldRow(
//               prefixImageTExtField:
//               'assets/images/icons/locationIcon.png',
//               hinText: 'Регион',
//             ),
//           ),
//           SizedBox(height: 27,),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 19.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: [
//                 ElevatedButton(
//                     style:dialogButtonStyle,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: Text(
//                       'Назад',
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                           fontSize: 12),
//                     )),
//                 ElevatedButton(
//                   style: dialogButtonStyle,
//                   onPressed: () {
//                     Navigator.pop(context);
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) =>  BrandPage(),
//                         ));
//                   },
//                   child: Text(
//                     'Далее',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.w600,
//                         fontSize: 12),
//                   ),
//                 ),
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   ),
// );
