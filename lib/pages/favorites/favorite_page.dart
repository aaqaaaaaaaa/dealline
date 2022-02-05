import 'package:dealline/pages/category_page/cubit/category_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../styles/styles.dart';
import '../../widgets/bloc_card/card_grid_horizontal.dart';
import '../../widgets/bloc_card/cardgrid_cubit.dart';
import '../menu_page/dialogs/dialog_yejednevniye.dart';
import '../product_item_screen/element_card_widget_in_hero.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final box = Hive.box('Favorite_Box');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        padding: EdgeInsets.all(0),
                        onPressed: () => Navigator.pop(context),
                        icon: Image.asset(
                            'assets/images/icons/navigator_pop_icon.png')),
                    Text(
                      'Избранное',
                      style: TextStyle(color: Color(0xff2d2d2d), fontSize: 13),
                    ),
                    // Expanded(child: Card()),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  child: Image.asset('assets/images/icons/poopup_menu.png'))
            ],
          ),
        ),
        body: ListView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            itemCount: box.values.length,
            itemBuilder: (context, int index) {
              return Slidable(
                direction: Axis.horizontal,
                endActionPane: ActionPane(
                  motion: ScrollMotion(),
                  children: [
                    SlidableAction(
                      flex: 1,
                      onPressed: (context) {
                        setState(() {});
                        box.deleteAt(index);
                        print(' uchib ketti ${box.delete(index)}');
                        // CardList.removeAt(index);
                      },
                      backgroundColor: primaryColor,
                      foregroundColor: Colors.white,
                      icon: Icons.delete_outline,
                      label: 'Delete',
                    ),
                  ],
                ),
                child: Card(
                  child: ListTile(
                    title: Text(box.get('favorite')),
                    subtitle: Text('${CardList[index].price}'),
                    leading: Image.asset('${CardList[index].image}'),
                  ),
                ),
                // child: Card(
                //   child: ListTile(
                //     title: Text(state.favorite[index].title),
                //     subtitle: Text('${state.favorite[index].price}'),
                //     leading: Image.asset('${state.favorite[index].image}'),
                //   ),
                // ),
              );
              // CardGridWidget(
              //   id: state.cardState[index].id,
              //   selectedItem: state.cardState[index].isSelected,
              //   price: state.cardState[index].price,
              //   description: '${state.cardState[index].description}',
              //   image: "${state.cardState[index].image}",
              //   title: '${state.cardState[index].title}');

              //   isActiveColor: activeColor,
              //   numb: CategoryItemList[index].number,
              //   titles: '${CategoryItemList[index].title}',
              //   images: '${CategoryItemList[index].image}',
              //   id: CategoryItemList[index].id,
              //   callback: () {
              //     setState(() {
              //       if (CategoryItemList[index].id == index)
              //         activeColor = !activeColor;
              //     });
              //   },
              // );
            }));
  }
}
