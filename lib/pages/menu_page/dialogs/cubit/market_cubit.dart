import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../data/data.dart';

part 'market_state.dart';

class MarketCubit extends Cubit<MarketState> {
  List<MagzinModel> marketCubit;
  TextEditingController? filter = TextEditingController();
  String? title;
  String? region;

  MarketCubit({required this.marketCubit, this.filter, this.title, this.region})
      : super(
          MarketState(
            markets: marketCubit,
            filter: filter,
            region: region,
            title: title,
          ),
        );

  void searchMarket(String query) => emit(MarketState(
      markets: market_list.where((brand) {
        final titleLower = brand.dokon.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList(),
      filter: filter));

  void onSelected(int index) {
    for (int i = 0; i < state.markets.length; i++) {
      if (index == i) {
        title = market_list[index].dokon;
        region = market_list[index].region;
        emit(MarketState(
          markets: market_list,
          region: region,
          title: title,
        ));
      }
    }
  }
}
