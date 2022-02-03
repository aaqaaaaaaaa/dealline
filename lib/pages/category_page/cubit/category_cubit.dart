import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../widgets/bloc_card/card_grid_horizontal.dart';
import '../../../widgets/category_item.dart';
import '../../product_item_screen/element_card_widget_in_hero.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  List<CategoryItem> category;
  List<CardInGridViewHorizontal> cardGrid;
  late String? catName;
  ScrollController? controller;
  final itemController= ItemScrollController();
  CategoryCubit({required this.category,required this.cardGrid, this.catName,this.controller})
      : super(CategoryState(
          brands: category, cardGrid: cardGrid,
        ));

  void onPressedSee() {
    bool isOnPressed = true;
    isOnPressed = !isOnPressed;
    emit(OnPressedSeeAllState(oisPressed: isOnPressed));
  }

  void callBack(int index, bool activeColor, ) {
    emit(CategoryState(catName: catName, brands: category, cardGrid: cardGrid));
    for (int i = 0; i < state.brands.length; i++) {
      if (index == i) {
        state.itemController?.scrollTo(index: state.brands[index].id, duration: Duration(seconds: 1));

        print('controll');
        print(state.itemController);
        // controller = state.brands[5].id.toDouble();
        controller?.animateTo(state.brands[5].id.toDouble(),
            duration: Duration(seconds: 1), curve: Curves.ease);
        catName = state.brands[index].title;
        state.brands[index].isActiveColor = true;
        state.catName = state.brands[index].title;
        debugPrint(state.catName);
      } else {
        state.brands[i].isActiveColor = false;
      }
    }
    activeColor = true;
  }


  void callbackGrid(int index, BuildContext context) {
    emit(CategoryState(catName: catName, brands: category, cardGrid: cardGrid));
    for (int i = 0; i <  state.cardGrid.length; i++) {
      if (i == index) {
      BlocProvider.of<CategoryCubit>(context).cardGrid[i].isSelected = true;
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CardElementWidgetInHero(index: index, isSelected: state.cardGrid[i].isSelected,),
          ));
      print(BlocProvider.of<CategoryCubit>(context).cardGrid[i].isSelected);}
      else{
        state.cardGrid[i].isSelected = false;
        print('Bomadi');
      }
    }}



    // for (int i = 0; i < state.brands.length; i++) {
    //   if (index == i) {
    //     state.itemController?.scrollTo(index: state.brands[index].id, duration: Duration(seconds: 1));
    //
    //     print('controll');
    //     print(state.itemController);
    //     // controller = state.brands[5].id.toDouble();
    //     controller?.animateTo(state.brands[5].id.toDouble(),
    //         duration: Duration(seconds: 1), curve: Curves.ease);
    //     catName = state.brands[index].title;
    //     state.brands[index].isActiveColor = true;
    //     state.catName = state.brands[index].title;
    //     debugPrint(state.catName);
    //   } else {
    //     state.brands[i].isActiveColor = false;
    //   }
    // }
    // activeColor = true;


  void searchCategory(String query) {
    TextEditingController? filter = TextEditingController();

    emit(CategoryState(
      brands: CategoryItemList.where((brand) {
        final titleLower = brand.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList(),
      filter: filter, cardGrid: cardGrid,
    ));
  }
}
