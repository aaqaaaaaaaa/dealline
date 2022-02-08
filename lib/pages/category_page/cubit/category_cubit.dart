import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../../../widgets/bloc_card/card_grid_horizontal.dart';
import '../../../widgets/category_item.dart';
import '../../product_item_screen/entity/element_card.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  List<CategoryItem> category;

  // List<CardInGridViewHorizontal> cardGrid;
  late String? catName;
  ScrollController? controller;

  // final itemController = ItemScrollController();
  int initialScrollIndex = 0;

  CategoryCubit(
      {required this.category,
      this.catName,
      required this.initialScrollIndex,
      this.controller})
      : super(CategoryState(
          brands: category,
          initialScrollIndexState: initialScrollIndex,
        ));

  void onPressedSee() {
    bool isOnPressed = true;
    isOnPressed = !isOnPressed;
    emit(OnPressedSeeAllState(
      oisPressed: isOnPressed,
    ));
  }

  void callBack(int index, bool activeColor) {
    emit(CategoryState(
        catName: catName,
        brands: category,
        // itemController: itemController,
        initialScrollIndexState: initialScrollIndex,
        controller: controller));
    for (int i = 0; i < state.brands.length; i++) {
      if (index == i) {
        // itemController.scrollTo(
        //     index: state.brands[index].id, duration: Duration(seconds: 1));
        state.initialScrollIndexState = state.brands[index].id;
        print(initialScrollIndex);
        print('control');
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

  void favoriteCallBack(
      int index, List<CardInGridViewHorizontal> favorite) async {
    emit(
      FavoriteState(
        brands: category,
        initialScrollIndexState: initialScrollIndex,
        favorite: favorite,
      ),
    );
    for (int i = 0; i < favorite.length; i++) {
      if (index == i) {
        if (!Hive.isAdapterRegistered(1)) {
          Hive.registerAdapter(ElementCardAdapter());
        }
        final box = await Hive.openBox<ElementCard>('group_box');
        final group = ElementCard(
            name: CardList[index].title,
            image: '${CardList[index].image}',
            price: '${CardList[index].price}',
            description: CardList[index].description);
        await box.add(group);
        print(' Favorite ${box.get('group_box')}');
      }
    }
  }

  void searchCategory(String query) {
    TextEditingController? filter = TextEditingController();

    emit(CategoryState(
      brands: CategoryItemList.where((brand) {
        final titleLower = brand.title.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower);
      }).toList(),
      filter: filter,
      initialScrollIndexState: initialScrollIndex,
    ));
  }
}
