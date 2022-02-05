import 'package:auto_size_text/auto_size_text.dart';
import 'package:dealline/grid_in_categories/categories_grid_in_horizontal.dart';
import 'package:dealline/pages/favorites/favorite_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/bloc_card/card_grid_horizontal.dart';
import 'package:dealline/widgets/category_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'cubit/category_cubit.dart';

class Category extends StatelessWidget {
  Category({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoryCubit>(
      create: (context) => CategoryCubit(category: CategoryItemList, initialScrollIndex: 0),
      child: CategoryPage(
        title: title,
      ),
    );
  }
}

// ignore: must_be_immutable
class CategoryPage extends StatefulWidget {
  CategoryPage({Key? key, required this.title}) : super(key: key);
  String title;

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

const textStyle = TextStyle(color: Color(0xffB5B5B5), fontSize: 10);
const categoryTextStyle = TextStyle(color: Color(0xff2d2d2d), fontSize: 10);

class _CategoryPageState extends State<CategoryPage> {
  Icon _searchIcon = Icon(
    Icons.search_rounded,
    color: primaryColor.withOpacity(0.7),
  );
  Widget _appBarSearchIcon = Container();
  final Color subtitleColor = Color(0xffA3A3A3);
  bool activeColor = false;
  bool onPressedSeeAll = true;
  String catName = '';

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    // catName = BlocProvider.of<CategoryCubit>(context).state.catName!;
    print(" catName ${catName}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          flexibleSpace: Image.asset(
            'assets/images/brand_logo/samsung-ecobubble-ww6000-review-the-ww80j6410cw-a-fantastic-washing-machine-3 1.png',
            fit: BoxFit.cover,
            color: Colors.grey.withOpacity(0.3),
            // color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.modulate,
          ),
          automaticallyImplyLeading: false,
          leading: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Image.asset('assets/images/icons/ic_back.png')),
          title: const Text(
            'Бренды',
            style: TextStyle(color: primaryColor, fontSize: 13),
          ),
          bottom: PreferredSize(
            preferredSize: const Size(double.infinity, 40),
            child: Container(
              margin: EdgeInsets.only(bottom: 10, left: 30,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FavoritesPage(),
                          )),
                      icon: Image.asset('assets/images/icons/korzina Icon.png')),
                  _appBarSearchIcon,
                  InkWell(
                    onTap: _searchPressed,
                    child: _searchIcon,
                  ),
                  // Container(
                  //   height: 137,
                  //   decoration: BoxDecoration(
                  //     color: Colors.black.withOpacity(1),
                  //     image: const DecorationImage(
                  //       fit: BoxFit.cover,
                  //       image: AssetImage(
                  //         'assets/images/brand_logo/samsung-ecobubble-ww6000-review-the-ww80j6410cw-a-fantastic-washing-machine-3 1.png',
                  //       ),
                  //     ),
                  //   ),
                  //   child: Container(
                  //     color: Colors.black.withOpacity(0.7),
                  //     child: Column(
                  //       children: [
                  //         const SizedBox(
                  //           height: 35,
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.start,
                  //             children: [
                  //               IconButton(
                  //                   onPressed: () => Navigator.pop(context),
                  //                   icon: Image.asset(
                  //                       'assets/images/icons/ic_back.png')),
                  //               const Text(
                  //                 'Меню',
                  //                 style:
                  //                 TextStyle(color: primaryColor, fontSize: 13),
                  //               )
                  //             ],
                  //           ),
                  //         ),
                  //         Container(
                  //           margin: EdgeInsets.symmetric(horizontal: 30),
                  //           child: Row(
                  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //             children: [
                  //               Image.asset('assets/images/icons/korzina Icon.png'),
                  //               _appBarSearchIcon,
                  //               InkWell(
                  //                 onTap: _searchPressed,
                  //                 child: _searchIcon,
                  //               )
                  //             ],
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // bottom: PreferredSize(
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 30),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Image.asset('assets/images/icons/korzina Icon.png'),
                  //         _appBarSearchIcon,
                  //         InkWell(
                  //           onTap: _searchPressed,
                  //           child: _searchIcon,
                  //         )
                  //       ],
                  //     ),
                  //   ),
                  //   preferredSize: Size.fromHeight(117),
                  // ),
                ],
              ),
            ),
          ),
        ),
        body: BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Container(
                //   height: 137,
                //   decoration: BoxDecoration(
                //       color: Colors.black.withOpacity(1),
                //       image: const DecorationImage(
                //           fit: BoxFit.cover,
                //           image: AssetImage(
                //             'assets/images/brand_logo/samsung-ecobubble-ww6000-review-the-ww80j6410cw-a-fantastic-washing-machine-3 1.png',
                //           ))),
                //   child: Container(
                //     color: Colors.black.withOpacity(0.7),
                //     child: Column(
                //       children: [
                //         const SizedBox(
                //           height: 35,
                //         ),
                //         Padding(
                //           padding: const EdgeInsets.symmetric(horizontal: 5.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.start,
                //             children: [
                //               IconButton(
                //                   onPressed: () => Navigator.pop(context),
                //                   icon: Image.asset(
                //                       'assets/images/icons/ic_back.png')),
                //               const Text(
                //                 'Бренды',
                //                 style: TextStyle(
                //                     color: primaryColor, fontSize: 13),
                //               )
                //             ],
                //           ),
                //         ),
                //         Container(
                //           margin: EdgeInsets.symmetric(horizontal: 30),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               IconButton(
                //                 icon: Image.asset(
                //                     'assets/images/icons/korzina Icon.png'),
                //               onPressed: (){
                //                   Navigator.push(context, MaterialPageRoute(builder: (context) => FavoritesPage(),));
                //               },
                //               ),
                //
                //               _appBarSearchIcon,
                //               InkWell(
                //                 onTap: _searchPressed,
                //                 child: _searchIcon,
                //               )
                //             ],
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                onPressedSeeAll
                    ? Row(
                        children: [
                          Text.rich(TextSpan(children: [
                            TextSpan(
                                text: '    ${widget.title}', style: textStyle),
                            TextSpan(text: '     Категории', style: textStyle),
                            TextSpan(
                                text: '     ${state.catName ?? ''}',
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
                      )
                    : Container(),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxHeight:onPressedSeeAll? MediaQuery.of(context).size.height / 1.28: MediaQuery.of(context).size.height / 1.24,
                      maxWidth: MediaQuery.of(context).size.width / 1.1),
                  child: activeColor
                      ? Column(
                          children: [
                            onPressedSeeAll
                                ? ConstrainedBox(
                                    constraints: BoxConstraints(
                                        maxHeight: 160,
                                        maxWidth:
                                            MediaQuery.of(context).size.width *
                                                100),

                                    child: CategoriesGridHorizontal(index: state.initialScrollIndexState,))
                                : Container(),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 200,
                                  child: AutoSizeText(
                                    '${state.catName ?? ''}',
                                    maxLines: 1,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 13),
                                  ),
                                ),
                                Expanded(child: Container()),
                                Row(
                                  children: [
                                    TextButton(
                                      onPressed: () => setState(
                                        () =>
                                            onPressedSeeAll = !onPressedSeeAll,
                                      ),
                                      child: Text(
                                        'Посмотреть все',
                                        style: TextStyle(
                                            fontSize: 10, color: Colors.black),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      size: 12,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ],
                            ),
                            Expanded(child: categoriesCardGridHorizontal(context,onPressedSeeAll)),
                          ],
                        )
                      : categoriesGrid(context),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }

  /// uchtalik GridView.builderning widgeti
  // Widget categoriesGrid(BuildContext context) {
  //   return BlocBuilder<CategoryCubit, CategoryState>(
  //     builder: (context, state) {
  //       return GridView.builder(
  //         controller: state.controller,
  //         itemCount:
  //             BlocProvider.of<CategoryCubit>(context).state.brands.length,
  //         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //             crossAxisCount: 3,
  //             crossAxisSpacing: 0,
  //             mainAxisSpacing: 5,
  //             childAspectRatio: 2.002 / 2.55),
  //         itemBuilder: (context, int index) {
  //           final brand = state.brands[index];
  //           // return buildCategory(brand, index);
  //           return CategoryItems(
  //             isActiveColor: brand.isActiveColor,
  //             numb: brand.number,
  //             titles: '${brand.title}',
  //             images: '${brand.image}',
  //             id: brand.id,
  //             callback: () {
  //               BlocProvider.of<CategoryCubit>(context)
  //                   .callBack(index, activeColor,controller);
  //               debugPrint(' buuuuuuuuuuuuuuuu ${brand.title}');
  //               activeColor = true;
  //             },
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
  Widget categoriesGrid(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return GridView.builder(
          controller: state.controller,
          itemCount:
              BlocProvider.of<CategoryCubit>(context).state.brands.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 0,
              mainAxisSpacing: 5,
              childAspectRatio: 2.002 / 2.55),
          itemBuilder: (context, int index) {
            final brand = state.brands[index];
            CategoriesGridHorizontal(index: index,);
            // return buildCategory(brand, index);
            return CategoryItems(
              isActiveColor: brand.isActiveColor,
              numb: brand.number,
              titles: '${brand.title}',
              images: '${brand.image}',
              id: brand.id,
              callback: () {
                BlocProvider.of<CategoryCubit>(context)
                    .callBack(index, state.activeColor);
                debugPrint(' buuuuuuuuuuuuuuuu ${brand.title}');
                activeColor = true;
              },
            );
          },
        );
      },
    );
  }

  Widget textFieldWidget() {
    return Container(
      height: 22,
      margin: EdgeInsets.only(left: 12),
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
          color: Color(0xff515151).withOpacity(0.8),
          borderRadius: BorderRadius.circular(5)),
      child: TextField(
        autofocus: true,
        onChanged: (value) {
          BlocProvider.of<CategoryCubit>(context).searchCategory(value);
          print(value);
        },
        textAlignVertical: TextAlignVertical(y: 1),
        controller: BlocProvider.of<CategoryCubit>(context).state.filter,
        style: TextStyle(color: primaryColor, fontSize: 12),
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          suffixIcon: new Icon(
            Icons.search,
            color: primaryColor,
            size: 16,
          ),
          hintText: 'Поиск...',
          hintStyle: TextStyle(
            color: primaryColor.withOpacity(0.5),
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  void _searchPressed() {
    if (_searchIcon.icon == Icons.search_rounded) {
      print('true');
      _searchIcon = Icon(
        Icons.start,
        size: 0,
      );
      setState(() {});
      _appBarSearchIcon = textFieldWidget();
    } else {
      print('true');
      _searchIcon = Icon(
        Icons.search_rounded,
        color: primaryColor,
        size: 16,
      );
      BlocProvider.of<CategoryCubit>(context).state.filter?.clear();
    }
  }
}

///
