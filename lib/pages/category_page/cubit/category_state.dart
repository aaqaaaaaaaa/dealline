part of 'category_cubit.dart';

class CategoryState {
  late List<CategoryItem> brands;  List<CardInGridViewHorizontal> cardGrid;

  TextEditingController? filter = TextEditingController();
  late String? catName;
  late bool activeColor = false;
  ScrollController? controller;
  ItemScrollController? itemController= ItemScrollController();

  CategoryState({required this.cardGrid,required this.brands, this.controller, this.filter,this.catName, this.itemController});
}

class OnPressedSeeAllState extends CategoryState{
  late List<CategoryItem> brands=[];
  bool oisPressed;

  OnPressedSeeAllState({required this.oisPressed}) : super(brands: [],cardGrid: []);
}
// class ScrollState extends CategoryState{
//   // ScrollController controller =ScrollController();
//   ScrollState({required this.controller}) : super(brands: []);
// }