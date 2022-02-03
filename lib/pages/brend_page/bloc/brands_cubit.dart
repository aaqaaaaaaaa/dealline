import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../data/data.dart';

part 'brands_state.dart';

class BrandsCubit extends Cubit<BrandsState> {
  BrandsCubit({required this.brands, this.filter})
      : super(BrandsState(brands: model_list, filter: filter));
  List<BrandModel> brands;
  TextEditingController? filter = TextEditingController();

  void searchBrand(String query) => emit(BrandsState(
      brands: model_list.where((brand) {
        final titleLower = brand.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList(),
      filter: filter));


// void searchBrand(String query) {
//   var brands = model_list.where((brand) {
//     final titleLower = brand.title.toLowerCase();
//     final searchLower = query.toLowerCase();
//     return titleLower.contains(searchLower);
//   }).toList();
//   state.brands = brands;
// }
}
