import 'dart:ui';

import 'package:dealline/pages/brend_page/bloc/brands_cubit.dart';
import 'package:dealline/pages/brend_page/data/data.dart';
import 'package:dealline/pages/category_page/category_page.dart';
import 'package:dealline/pages/favorites/favorite_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../favorites/favorites_model.dart';
import '../product_item_screen/entity/element_card.dart';

class BrandPage extends StatelessWidget {
   BrandPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BrandsCubit>(
      create: (context) => BrandsCubit(brands: model_list),
      child: Brands(),
    );
  }
}

class Brands extends StatefulWidget {
  Brands({Key? key}) : super(key: key);

  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  Icon _searchIcon = Icon(
    Icons.search_rounded,
    color: primaryColor.withOpacity(0.7),
  );

  // TextEditingController _filter = TextEditingController();
  Widget _appBarSearchIcon = Container();

  //
  // BrandsState() {
  //   _filter.addListener(() {
  //     if (_filter.text.isEmpty) {
  //       setState(() {
  //         _searchText = "";
  //         filteredNames = names;
  //       });
  //     } else {
  //       setState(() {
  //         _searchText = _filter.text;
  //       });
  //     }
  //   });
  // }
  int groupCount = 4;

  //
  // @override
  // void setState(F) async {
  //   final box = await Hive.openBox<ElementCard>('group_box');
  //   int count = box.length;
  //   groupCount = count;
  //   BlocProvider.of<BrandsCubit>(context).brands = model_list;
  //   super.setState();
  // }
  @override
  void setState(VoidCallback fn) async {
    super.setState(fn);
    final box = await Hive.openBox<ElementCard>('group_box');
    int count = box.length;
    groupCount = count;
  }

  // void _searchPressed() {
  //   setState(() {
  //     if (bloc.searchIcon.icon == Icons.search_rounded) {
  //       bloc.searchIcon = Icon(
  //         Icons.start,
  //         size: 0,
  //       );
  //       bloc.appBarSearchIcon = textFieldWidget();
  //     } else {
  //       bloc.searchIcon = Icon(
  //         Icons.search_rounded,
  //         color: primaryColor,
  //         size: 16,
  //       );
  //       _filter.clear();
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    int groupCount =
    GroupsWidgetModelProvider.read(context)?.model.groups.length ?? 4;
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
          'Меню',
          style: TextStyle(color: primaryColor, fontSize: 13),
        ),
        bottom: PreferredSize(
          preferredSize: const Size(double.infinity, 40),
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 30, right: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  fit: StackFit.loose,
                  alignment: AlignmentDirectional.topEnd,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FavoritesPage(),
                        ),
                      ),
                      icon: Image.asset('assets/images/icons/korzina Icon.png'),
                    ),
                    Positioned(
                      top: 7,
                      right: 10,
                      child: Container(
                        padding:
                            EdgeInsets.only(left: 5, right: 5, bottom: 1.5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.red),
                        alignment: Alignment.center,
                        child: Text('${groupCount}',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.start),
                      ),
                    )
                  ],
                ),
                _appBarSearchIcon,
                InkWell(
                  onTap: _searchPressed,
                  child: _searchIcon,
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              const Text(
                'Бренды',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: textColor),
              ),
              BlocBuilder<BrandsCubit, BrandsState>(
                builder: (context, state) {
                  return GridView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(10),
                    itemCount: state.brands.length,
                    itemBuilder: (context, index) {
                      final brand = state.brands[index];
                      return buildBrand(brand);
                    },
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200,
                        crossAxisSpacing: 2,
                        childAspectRatio: 4.5 / 2.1),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _elementCount(int count) async {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ElementCardAdapter());
    }
    final box = await Hive.openBox<ElementCard>('group_box');
    count = box.length;
  }

  Widget buildBrand(BrandModel brands) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Category(
              title: '${brands.title}',
            ),
          )),
      child: Container(
        height: 73,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: backgroundLogoColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 1),
          child: Image.asset(
            '${brands.image}',
            height: 10,
          ),
        ),
      ),
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
          BlocProvider.of<BrandsCubit>(context).searchBrand(value);
          print(value);
        },
        textAlignVertical: TextAlignVertical(y: 1),
        controller: BlocProvider.of<BrandsCubit>(context).state.filter,
        style: TextStyle(color: primaryColor, fontSize: 12),
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            suffixIcon: new Icon(
              Icons.search,
              color: primaryColor,
              size: 16,
            ),
            hintText: 'Поиск...',
            hintStyle:
                TextStyle(color: primaryColor.withOpacity(0.5), fontSize: 12)),
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
      print('false');
      _searchIcon = Icon(
        Icons.search_rounded,
        color: primaryColor,
        size: 16,
      );
      BlocProvider.of<BrandsCubit>(context).filter?.clear();
    }
  }

// void searchBrand(String query) {
//   final brands = model_list.where((brand) {
//     final titleLower = brand.title.toLowerCase();
//     final searchLower = query.toLowerCase();
//     return titleLower.contains(searchLower);
//   }).toList();
//
//   setState(() {
//     this.brands = brands;
//   });
// }
}
