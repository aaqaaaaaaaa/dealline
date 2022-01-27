import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';


/// 3talik  gridView uchun yasalgan class

class CategoryItem {
  String title;
  String image;
  int number;
  int id;
  bool isActiveColor;

  CategoryItem({
    required this.number,
    required this.title,
    required this.id,
    required this.image,
    required this.isActiveColor,
  });

  get idGetter => id;
}

List categoryList = [
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/holodilnik.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/holodilnik.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/holodilnik.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/holodilnik.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/holodilnik.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/conditsionerImage.png',
  'assets/images/category_image/holodilnik.png',
];
final itemsActiveColor = CategoryItems();
List<CategoryItem> CategoryItemList = [
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 12,
    id: 0,
    title: 'Кондиционеры',
    image: 'assets/images/category_image/conditsionerImage.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 2,
    id: 1,
    title: 'Холодильники',
    image: 'assets/images/category_image/holodilnik.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    id: 2,
    number: 15,
    title: 'Стиральные машины',
    image: 'assets/images/category_image/Cтиральные машины.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    id: 3,
    number: 14,
    title: 'Газовые плиты',
    image: 'assets/images/category_image/Газовые плиты.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 16,
    title: 'Миксеры',
    image: 'assets/images/category_image/Миксеры.png',
    id: 4,
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 18,
    title: 'Смартфоны',
    image: 'assets/images/category_image/Smartphone.png',
    id: 5,
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 19,
    title: 'Микроволновки',
    image: 'assets/images/category_image/Микроволновки.png',
    id: 6,
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    id: 7,
    number: 20,
    title: 'Фотоапараты',
    image: 'assets/images/category_image/Фотоапараты.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    id: 8,
    number: 112,
    title: 'Телевизор',
    image: 'assets/images/category_image/телевизор.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 19,
    title: 'Тостеры',
    image: 'assets/images/category_image/Тостеры.png',
    id: 9,
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    id: 10,
    number: 20,
    title: 'Фень',
    image: 'assets/images/category_image/Фень.png',
  ),
  CategoryItem(
    id: 11,
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 112,
    title: 'Тифалы',
    image: 'assets/images/category_image/Тифалы.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    number: 19,
    title: 'Пылесосы',
    image: 'assets/images/category_image/pilesos.png',
    id: 12,
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    id: 13,
    number: 20,
    title: 'Витеки',
    image: 'assets/images/category_image/vitek.png',
  ),
  CategoryItem(
    isActiveColor: itemsActiveColor.isActiveColor ?? false,
    id: 14,
    number: 112,
    title: 'Кострюли',
    image: 'assets/images/category_image/kostryulo.png',
  ),
];

class CategoryItems extends StatefulWidget {
  CategoryItems(
      {Key? key,
      this.id,
      this.numb,
      this.callback,
      this.titles,
      this.images,
      this.isActiveColor})
      : super(key: key);
  final int? numb;
  final int? id;
  final String? titles;
  final String? images;
  final bool? isActiveColor;
  final VoidCallback? callback;

  @override
  State<CategoryItems> createState() => _CategoryItemsState();
}

class _CategoryItemsState extends State<CategoryItems> {
  final Color subtitleColor = Color(0xffA3A3A3);

  // late int index;

  @override
  Widget build(BuildContext context) {
    // bool colorActive = widget.color;

    return Container(
      child: Column(
        children: [
          Container(
            height: 5,
            width: MediaQuery.of(context).size.width / 7,
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: widget.isActiveColor! ? primaryColor : Colors.transparent,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Card(),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            width: MediaQuery.of(context).size.width / 1,
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                debugPrint('Tapped');
                widget.callback!();

              },

              // setState(() {
              //   CategoryItemList[index].id == index?
              //   colorActive = true :colorActive=false;
              // });

              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: widget.isActiveColor!
                            ? primaryColor
                            : categoryBackgroundColor,
                        borderRadius: BorderRadius.circular(8)),
                    // padding: const EdgeInsets.symmetric(
                    //   horizontal: 9.0,
                    //   vertical: 18,
                    // ),
                    height: 101,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Image.asset(widget.images!),
                    ),
                  ),
                  Text(
                    '${widget.titles}',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 10),
                  ),
                  Text(
                    '${widget.numb} техники',
                    style: TextStyle(
                      color: subtitleColor,
                      fontSize: 8,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
