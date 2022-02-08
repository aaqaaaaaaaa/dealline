part of 'category_cubit.dart';

class CategoryState {
  late List<CategoryItem> brands;
  TextEditingController? filter = TextEditingController();
  late String? catName;
  late bool activeColor = false;
  late List<CardInGridViewHorizontal> favorite;

  ScrollController? controller;

  // ItemScrollController itemController= ItemScrollController();
  BuildContext? contextState;
  int initialScrollIndexState;

  CategoryState({
    required this.brands,
    this.contextState,
    this.controller,
    required this.initialScrollIndexState,
    this.filter,
    this.catName,
  });
}

class FavoriteState extends CategoryState {
  int index = 0;
  late List<CardInGridViewHorizontal> favorite;
  FavoriteState({
    required this.favorite,
    required List<CategoryItem> brands,
    required int initialScrollIndexState,
  }) : super(brands: brands, initialScrollIndexState: initialScrollIndexState);
}

class OnPressedSeeAllState extends CategoryState {
  // late List<CategoryItem> brands=[];
  bool oisPressed;

  OnPressedSeeAllState({required this.oisPressed})
      : super(brands: [], initialScrollIndexState: 0);
}
// class ScrollState extends CategoryState{
//   // ScrollController controller =ScrollController();
//   ScrollState({required this.controller}) : super(brands: []);
// }
