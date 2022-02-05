import 'package:dealline/pages/category_page/category_page.dart';
import 'package:dealline/pages/category_page/cubit/category_cubit.dart';
import 'package:dealline/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class CategoriesGridHorizontal extends StatefulWidget {
  CategoriesGridHorizontal({Key? key, this.activeColor,required this.index, this.catName})
      : super(key: key);
  bool? activeColor;
  late String? catName;
int index =0;
  @override
  _CategoriesGridHorizontalState createState() =>
      _CategoriesGridHorizontalState();
}

class _CategoriesGridHorizontalState extends State<CategoriesGridHorizontal> {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (_, state) {
        return ScrollablePositionedList.builder(
            shrinkWrap: true,
            initialScrollIndex: widget.index,
            // itemScrollController: state.itemController,
            scrollDirection: Axis.horizontal,
            itemCount: state.brands.length,
            // controller: state.controller,
            // gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //     crossAxisCount: 1,
            //     crossAxisSpacing: 0,
            //     mainAxisSpacing: 7,
            //     childAspectRatio: 2 / 1.6),
            itemBuilder: (_, int index) {
              final brand = state.brands[index];
              return Container(
                width: 120,
                height: 100,
                child: CategoryItems(
                    isActiveColor: brand.isActiveColor,
                    numb: brand.number,
                    titles: '${brand.title}',
                    images: '${brand.image}',
                    id: brand.id,
                    callback: () => BlocProvider.of<CategoryCubit>(context)
                        .callBack(index, state.activeColor)
                    // setState(() {
                    //   for (int i = 0; i < state.brands.length; i++) {
                    //     if (index == i) {
                    //       brand.isActiveColor = true;
                    //       widget.catName = brand.title;
                    //       debugPrint(' cacacacaa ${widget.catName}');
                    //     } else {
                    //       state.brands[i].isActiveColor = false;
                    //     }
                    //   }
                    //   widget.activeColor = true;
                    // });
                    ),
              );
            });
      },
    );
  }
//
// GridView.builder(
//
// scrollDirection: Axis.horizontal,
// itemCount: state.brands.length,
// controller: state.controller,
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 1,
// crossAxisSpacing: 0,
// mainAxisSpacing: 7,
// childAspectRatio: 2 / 1.6),
// itemBuilder: (context, int index) {
// final brand = state.brands[index];
// return CategoryItems(
// isActiveColor: brand.isActiveColor,
// numb: brand.number,
// titles: '${brand.title}',
// images: '${brand.image}',
// id: brand.id,
// callback: () => BlocProvider.of<CategoryCubit>(context)
//     .callBack(index, state.activeColor,controller)
// // setState(() {
// //   for (int i = 0; i < state.brands.length; i++) {
// //     if (index == i) {
// //       brand.isActiveColor = true;
// //       widget.catName = brand.title;
// //       debugPrint(' cacacacaa ${widget.catName}');
// //     } else {
// //       state.brands[i].isActiveColor = false;
// //     }
// //   }
// //   widget.activeColor = true;
// // });
// );
// });
// Widget buildCategory(CategoryItem item, int index) {
//   return CategoryItems(
//     isActiveColor: item.isActiveColor,
//     numb: item.number,
//     titles: '${item.title}',
//     images: '${item.image}',
//     id: item.id,
//     callback: () {
//       setState(() {
//         BlocProvider.of<CategoryCubit>(context).state.catName =
//             BlocProvider.of<CategoryCubit>(context).catName;
//         print(
//             'dastur ${BlocProvider.of<CategoryCubit>(context).state.catName}');
//
//         debugPrint(
//             BlocProvider.of<CategoryCubit>(context).category[index].title);
//
//         for (int i = 0;
//             i < BlocProvider.of<CategoryCubit>(context).category.length;
//             i++) {
//           if (index == i) {
//             item.isActiveColor = true;
//             BlocProvider.of<CategoryCubit>(context).state.catName =
//                 BlocProvider.of<CategoryCubit>(context).catName;
//             print(
//                 'dastur ${BlocProvider.of<CategoryCubit>(context).state.catName}');
//             // catName = CategoryItemList[index].title;
//             // debugPrint(catName);
//             // if(CategoryItemList[index].isActiveColor ==true){
//             //   catName = CategoryItemList[index].title;
//             // }
//           } else {
//             item.isActiveColor = false;
//           }
//         }
//         widget.activeColor = true;
//       });
//     },
//   );
// }
}
