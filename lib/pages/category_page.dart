import 'package:dealline/grid_in_categories/categories_grid_in_horizontal.dart';
import 'package:dealline/pages/brends.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/card_grid_horizontal.dart';
import 'package:dealline/widgets/category_item.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
   CategoryPage({Key? key,required this.title}) : super(key: key);
 String  title;
 static String name = '';
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

const textStyle = TextStyle(color: Color(0xffB5B5B5), fontSize: 10);
const categoryTextStyle = TextStyle(color: Color(0xff2d2d2d), fontSize: 10);

class _CategoryPageState extends State<CategoryPage> {
  final Color subtitleColor = Color(0xffA3A3A3);
  bool activeColor = false;
  int ind = 0;
  final categoryMap = Brands();
  String catName = '';

  List list = [for (int i = 0; i < CategoryItemList.length; i++) i];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: 137,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(1),
                  image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                        'assets/images/brand_logo/samsung-ecobubble-ww6000-review-the-ww80j6410cw-a-fantastic-washing-machine-3 1.png',
                      ))),
              child: Container(
                color: Colors.black.withOpacity(0.7),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () =>
                                  // debugPrint('return');
                                  Navigator.pop(context),
                              // icon: const Icon(
                              //   Icons.arrow_back_outlined,
                              //   color: primaryColor,
                              // ),
                              icon: Image.asset(
                                  'assets/images/icons/ic_back.png')),
                          const Text(
                            'Бренды',
                            style: TextStyle(color: primaryColor, fontSize: 13),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: '    ${widget.title}',style: textStyle),
                  TextSpan(text: '     Категории', style: textStyle),
                  TextSpan(
                      text: '     ${catName}',
                      style: categoryTextStyle)
                ])),
                Expanded(child: Container()),
                IconButton(
                    onPressed: () {
                      setState(() {
                        activeColor = !activeColor;

                      });
                    },
                    icon: activeColor
                        ? Image.asset(
                            'assets/images/category_image/horizontal grid.png')
                        : Image.asset(
                            'assets/images/category_image/vertical icon.png'))
              ],
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.32,
                    maxWidth: MediaQuery.of(context).size.width / 1.1),
                child: activeColor
                    ? isGridViewHorizontal(context)
                    : categoriesGrid(context)),
          ],
        ),
      ),
    );
  }


  Widget categoriesGrid(BuildContext context) {
    // final item = CategoryItem;

    return GridView.builder(
        itemCount: CategoryItemList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 0,
            mainAxisSpacing: 5,
            childAspectRatio: 2.002 / 2.55),
        itemBuilder: (context, int index) {
          return CategoryItems(
            isActiveColor: CategoryItemList[index].isActiveColor,
            numb: CategoryItemList[index].number,
            titles: '${CategoryItemList[index].title}',
            images: '${CategoryItemList[index].image}',
            id: CategoryItemList[index].id,
            callback: () {
              setState(() {
                debugPrint(CategoryItemList[index].title);

                for (int i = 0; i < CategoryItemList.length; i++) {

                  if (index == i) {
                    CategoryItemList[index].isActiveColor = true;
                    catName  = CategoryItemList[index].title;
                    // catName = CategoryItemList[index].title;
                    // debugPrint(catName);
                    // if(CategoryItemList[index].isActiveColor ==true){
                    //   catName = CategoryItemList[index].title;
                    // }
                  } else {
                    CategoryItemList[i].isActiveColor = false;

                  }
                }
                activeColor = true;

              });
            },
          );
        });
  }

  Widget isGridViewHorizontal(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: 160,
                maxWidth: MediaQuery.of(context).size.width * 100),
            child: CategoriesGridHorizontal(activeColor: activeColor,catName: catName,)),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Холодельники',
              style: TextStyle(color: Colors.black, fontSize: 13),
            ),
            Expanded(child: Container()),
            Text(
              'Посмотреть все',
              style: TextStyle(fontSize: 10),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 12,
              color: Colors.black,
            )
          ],
        ),
        ConstrainedBox(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 1.9,
              maxWidth: MediaQuery.of(context).size.width / 1.1),
          child: categoriesCardGridHorizontal(context),
        ),
      ],
    );
  }

}


///
