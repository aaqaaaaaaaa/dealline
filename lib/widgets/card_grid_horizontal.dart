import 'package:dealline/pages/element_card_widget_in_hero.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/category_item.dart';
import 'package:flutter/material.dart';

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

List<CardInGridViewHorizontal> CardList = [
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
      this.price})
      : super(key: key);
  final String? image;
  final String? title;
  final String? description;
  final int? price;
  final bool? selectedItem;

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
            onTap: () {
              for (int i = 0; i < CardList.length; i++) {
                CardList[i].isSelected = true;
              }
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CardElementWidgetInHero(),
                  ));
              // debugPrint('${CategoryItemList[index]}');
            },
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

Widget categoriesCardGridHorizontal(BuildContext context) {
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
        return Hero(
          tag: CardList[index].isSelected == true,
          child: CardGridWidget(
              selectedItem: CardList[index].isSelected,
              price: CardList[index].price,
              description: '${CardList[index].description}',
              image: "${CardList[index].image}",
              title: '${CardList[index].title}'),
        );

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
}
