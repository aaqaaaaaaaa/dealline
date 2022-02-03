import 'package:dealline/pages/category_page/cubit/category_cubit.dart';
import 'package:dealline/pages/product_item_screen/element_card_widget_in_hero.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/bloc_card/cardgrid_cubit.dart';
import 'package:dealline/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Холодельники   /// Посмотреть все
///ostidagi kartalar
ScrollController controller = ScrollController();

class CardInGridViewHorizontal {
  String image;
  String title;
  String description;
  int price;
  bool isSelected;

  CardInGridViewHorizontal(
      {required this.image,
      required this.isSelected,
      required this.title,
      required this.description,
      required this.price});
}

final CardList = <CardInGridViewHorizontal>[
  CardInGridViewHorizontal(
    image: 'assets/images/card_images/holodilnik_black.png',
    title: 'Samsung RT6000K 530л',
    description: 'Система Twin Cooling Plus\n'
        'Инверторный компрессор DIT\n'
        'Функция Power Cool',
    price: 1995000,
    isSelected: false,
  ),
  CardInGridViewHorizontal(
      image: 'assets/images/card_images/holodilnik_white.png',
      title: 'Samsung RT6000K 530л',
      isSelected: false,
      description: 'Система Twin Cooling Plus\n'
          'Инверторный компрессор DIT\n'
          'Функция Power Cool',
      price: 1995000),
  CardInGridViewHorizontal(
      isSelected: false,
      image: 'assets/images/card_images/holodilnik_white.png',
      title: 'Samsung RT6000K 530л',
      description: 'Система Twin Cooling Plus'
          'Инверторный компрессор DIT'
          'Функция Power Cool',
      price: 1995000),
  CardInGridViewHorizontal(
      isSelected: false,
      image: 'assets/images/card_images/holodilnik_white.png',
      title: 'Samsung RT6000K 530л',
      description: 'Система Twin Cooling Plus'
          'Инверторный компрессор DIT'
          'Функция Power Cool',
      price: 1995000),
];

class CardGridWidget extends StatefulWidget {
  const CardGridWidget(
      {Key? key,
      this.image,
      this.selectedItem,
      this.title,
      this.description,
      this.price, this.callbackGrid})
      : super(key: key);
  final String? image;
  final String? title;
  final String? description;
  final int? price;
  final bool? selectedItem;
  final VoidCallback? callbackGrid;

  @override
  _CardGridWidgetState createState() => _CardGridWidgetState();
}

class _CardGridWidgetState extends State<CardGridWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Expanded(child: Container()),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('${widget.image}'),
                Text(
                  '${widget.title}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '${widget.description}',
                  style: TextStyle(
                    color: Color(0xff858585),
                    fontSize: 7,
                  ),
                ),
                Text(
                  '${widget.price} сум',
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff212121)),
                ),
              ],
            ),
          ),
          Expanded(child: Container()),
          InkWell(
            borderRadius: BorderRadius.circular(8),
            onTap: () =>BlocProvider.of<CategoryCubit>(context).callbackGrid(1,context),
              // for (int i = 0; i <  BlocProvider.of<CategoryCubit>(context).cardGrid.length; i++) {
              //   BlocProvider.of<CategoryCubit>(context).cardGrid[i].isSelected = true;
              //   print(BlocProvider.of<CategoryCubit>(context).cardGrid[i].isSelected);
              // }
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (context) => CardElementWidgetInHero(),
              //     ));
              // debugPrint('${CategoryItemList[index]}');

            child: Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              alignment: Alignment.bottomCenter,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(8),
                  bottomLeft: Radius.circular(8),
                ),
              ),
              child: Text('Узнать больше'),
            ),
          )
        ],
      ),
    );
  }
}

Widget categoriesCardGridHorizontal(BuildContext context, bool isOpen) {
  return Padding(
    padding: EdgeInsets.only(bottom: isOpen ? 23 : 0),
    child: BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return GridView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            itemCount: CardList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 7,
                childAspectRatio: 2 / 4),
            itemBuilder: (context, int index) {
              return CardGridWidget(
                  selectedItem: state.cardGrid[index].isSelected,
                  price: state.cardGrid[index].price,
                  description: '${state.cardGrid[index].description}',
                  image: "${state.cardGrid[index].image}",
                  title: '${state.cardGrid[index].title}');

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
            });
      },
    ),
  );
}
