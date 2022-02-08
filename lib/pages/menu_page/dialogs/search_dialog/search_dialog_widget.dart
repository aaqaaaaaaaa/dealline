import 'package:dealline/pages/brend_page/data/data.dart';
import 'package:dealline/pages/menu_page/dialogs/cubit/market_cubit.dart';
import 'package:dealline/pages/menu_page/dialogs/data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../../styles/styles.dart';
//
// class SearchDialog extends StatefulWidget {
//   SearchDialog({Key? key}) : super(key: key);
//
//   @override
//   State<SearchDialog> createState() => _SearchDialogState();
// }
//
// class _SearchDialogState extends State<SearchDialog> {
//   @override
//   Widget build(BuildContext context) {
//     int index = 6;
//     return BlocProvider<MarketCubit>(
//       create: (context) => MarketCubit(
//           marketCubit: market_list,
//           region: market_list[index].region,
//           title: market_list[index].dokon),
//       child: SearchDialogWidget(index: index),
//     );
//   }
// }

class SearchDialogWidget extends StatefulWidget {
  SearchDialogWidget({Key? key}) : super(key: key);

// BuildContext marketContext;
  @override
  _SearchDialogWidgetState createState() => _SearchDialogWidgetState();
}

class _SearchDialogWidgetState extends State<SearchDialogWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 28.0),
          child: BlocBuilder<MarketCubit, MarketState>(
            builder: (context, state) {
              return Dialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                // contentPadding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                insetPadding:
                const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                // titlePadding: EdgeInsets.all(0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      // height: 22,
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery
                          .of(context)
                          .size
                          .width / 1.4,
                      decoration: BoxDecoration(
                        // color: Color(0xff515151).withOpacity(0.8),
                          borderRadius: BorderRadius.circular(5)),
                      child: TextField(
                        autofocus: true,
                        onChanged: (value) {
                          BlocProvider.of<MarketCubit>(context)
                              .searchMarket(value);
                          print(value);
                        },
                        // textAlignVertical: TextAlignVertical(y: 1),
                        controller:
                        BlocProvider
                            .of<MarketCubit>(context)
                            .state
                            .filter,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          suffixIcon: Icon(
                            Icons.search,
                          ),
                          hintText: 'Поиск...',
                        ),
                      ),
                    ),
                 Container(
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 1.1,
                          height: 300,
                          child: ListView.separated(
                            separatorBuilder: (context, index) =>
                                Divider(height: 1),
                            itemCount: state.markets.length,
                            itemBuilder: (context, index) {
                              final market = state.markets[index];
                              return ListTile(
                                  onTap: () {
                                    BlocProvider.of<MarketCubit>(context)
                                        .onSelected(index);
                                    Navigator.pop(context);
                                  },
                                  title: Text('${state.markets[index].dokon}'));
                            },
                          ),

                    )
                  ],
                ),
              );
            },
          ),
        ),
    );
  }
}
//   Widget buildListMarket(
//       MagzinModel magzinModel, int index, BuildContext context) {
//     return ListTile(
//       onTap: () =>
//           BlocProvider.of<MarketCubit>(context).onSelected(index, context),
//       title: Text('${magzinModel.dokon}'),
//     );
//   }
// }
//
// class SearchListItem extends StatelessWidget {
//   const SearchListItem({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: ,
//     );
//   }
// }
