import 'package:dealline/pages/category_page/cubit/category_cubit.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/bloc_card/card_grid_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';


import '../favorites/favorites_model.dart';
import 'elements/element_widget.dart';

/// mahsulotni  alohida qilib  ko'rsatiladigan joy
class CardElementWidgetInHero extends StatefulWidget {
  CardElementWidgetInHero(
      {Key? key, required this.indexHero, required this.contextHero})
      : super(key: key);
  int indexHero;
  BuildContext contextHero;

  @override
  _CardElementWidgetInHeroState createState() =>
      _CardElementWidgetInHeroState();
}

class _CardElementWidgetInHeroState extends State<CardElementWidgetInHero> {
  @override
  Widget build(BuildContext context) {

    final model = GroupsWidgetModelProvider.read(context)?.model;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Image.asset(
                            'assets/images/icons/navigator_pop_icon.png')),
                    Text(
                      'Бренды',
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
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 1.2,
                maxWidth: MediaQuery.of(context).size.width / 1.1),
            child: CardGridElementWidget(
                price: CardList[widget.indexHero].price,
                description: '${CardList[widget.indexHero].description}',
                image: "${CardList[widget.indexHero].image}",
                title: '${CardList[widget.indexHero].title}'),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ElevatedButton(
          style: ButtonStyle(
              maximumSize: MaterialStateProperty.all(
                Size(324, 47),
              ),
              backgroundColor: MaterialStateProperty.all(primaryColor)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Text(
                  'Добавить в корзину',
                  style: TextStyle(color: Color(0xff212121), fontSize: 16),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Image.asset('assets/images/icons/favorite icon.png')
            ],
          ),
          onPressed: () {
            // Navigator.pop(context);

            Fluttertoast.showToast(
              msg: 'Добавлено в корзину!',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.black,
              fontSize: 16,
            );
            // model?.deleteGroup(widget.indexHero);
            BlocProvider.of<CategoryCubit>(widget.contextHero)
                .favoriteCallBack(widget.indexHero, CardList);
            Navigator.pop(context);
          }
          // int index = 1;
          // final item = CardInGridViewHorizontal;
          // Hive.box('Favorite_Box').put(CardList[index].id, item);
          // Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage(),));

          ),
    );
  }
}

