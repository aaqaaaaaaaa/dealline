import 'package:dealline/pages/category_page.dart';
import 'package:dealline/widgets/category_item.dart';
import 'package:flutter/material.dart';
class CategoriesGridHorizontal extends StatefulWidget {
  CategoriesGridHorizontal({
    Key? key,
     this.activeColor,
    this.catName
  }) : super(key: key);
  bool? activeColor;
  late String? catName;

  @override
  _CategoriesGridHorizontalState createState() =>
      _CategoriesGridHorizontalState();
}

class _CategoriesGridHorizontalState extends State<CategoriesGridHorizontal> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categoryList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 0,
            mainAxisSpacing: 7,
            childAspectRatio: 2 / 1.6),
        itemBuilder: (context, int index) {
          return CategoryItems(
            isActiveColor: CategoryItemList[index].isActiveColor,
            numb: CategoryItemList[index].number,
            titles: '${CategoryItemList[index].title}',
            images: '${CategoryItemList[index].image}',
            id: CategoryItemList[index].id,
            callback: () {
              setState(() {
                for (int i = 0; i < CategoryItemList.length; i++) {
                  if (index == i) {
                    CategoryItemList[index].isActiveColor = true;
                    widget.catName = CategoryItemList[index].title;
                    debugPrint(widget.catName);

                  } else {
                    CategoryItemList[i].isActiveColor = false;
                  }
                }
                widget.activeColor = true;
              });
            },
          );
        });
  }
}
