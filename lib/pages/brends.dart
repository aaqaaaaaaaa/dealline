import 'package:dealline/pages/category_page.dart';
import 'package:dealline/pages/menu_page.dart';
import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class BrandModel {
  String image;
  String title;

  BrandModel({
    required this.image,
    required this.title,
  });
}

List<BrandModel> model_list = [
  BrandModel(
      image: 'assets/images/brand_logo/samsungLog.png', title: 'Samsung'),
  BrandModel(image: 'assets/images/brand_logo/chigoLogo.png', title: 'Chigo'),
  BrandModel(image: 'assets/images/brand_logo/artelLogo.png', title: 'Artel'),
  BrandModel(
      image: 'assets/images/brand_logo/lg-logo-png-3 1.png', title: 'LG'),
  BrandModel(
      image: 'assets/images/brand_logo/phillipsLogo.png', title: 'Phillips'),
  BrandModel(
      image: 'assets/images/brand_logo/Panasonic_logo_blue 1.png',
      title: 'Panasonic'),
  BrandModel(
      image: 'assets/images/brand_logo/indesit-logo-logotype 1.png',
      title: 'Indesit'),
  BrandModel(image: 'assets/images/brand_logo/pioneer.png', title: 'Pioneer'),
  BrandModel(image: 'assets/images/brand_logo/Beko.png', title: 'Beko'),
  BrandModel(image: 'assets/images/brand_logo/sony Logo.png', title: 'Sony'),
  BrandModel(image: 'assets/images/brand_logo/miLogo.png', title: 'MI'),
  BrandModel(image: 'assets/images/brand_logo/1009px-Apple_logo_black 1.png', title: 'Apple'),
  BrandModel(image: 'assets/images/brand_logo/Canon 1.png', title: 'Canon'),
  BrandModel(image: 'assets/images/brand_logo/huawei 2.png', title: 'Huawei'),
];

class Brands extends StatefulWidget {
  Brands({Key? key}) : super(key: key);
  Map brandMap = {
    'assets/images/brand_logo/samsungLog.png': 'Samsung',
    'assets/images/brand_logo/chigoLogo.png': 'Chigo',
    'assets/images/brand_logo/artelLogo.png': 'Artel',
    'assets/images/brand_logo/lg-logo-png-3 1.png': 'LG',
    'assets/images/brand_logo/phillipsLogo.png': 'Phillips',
    'assets/images/brand_logo/Panasonic_logo_blue 1.png': 'Panasonic',
    'assets/images/brand_logo/indesit-logo-logotype 1.png': 'Indesit',
    'assets/images/brand_logo/pioneer.png': 'Pioneer',
    'assets/images/brand_logo/Beko.png': 'Beko',
    'assets/images/brand_logo/sony Logo.png': 'Sony',
    'assets/images/brand_logo/miLogo.png': 'MI',
    'assets/images/brand_logo/1009px-Apple_logo_black 1.png': 'Apple',
    'assets/images/brand_logo/Canon 1.png': "Canon",
    'assets/images/brand_logo/huawei 2.png': 'Huawei',
  };

  // List brandList = [
  //   'assets/images/brand_logo/samsungLog.png',
  //   'assets/images/brand_logo/chigoLogo.png',
  //   'assets/images/brand_logo/artelLogo.png',
  //   'assets/images/brand_logo/lg-logo-png-3 1.png',
  //   'assets/images/brand_logo/phillipsLogo.png',
  //   'assets/images/brand_logo/Panasonic_logo_blue 1.png',
  //   'assets/images/brand_logo/indesit-logo-logotype 1.png',
  //   'assets/images/brand_logo/pioneer.png',
  //   'assets/images/brand_logo/Beko.png',
  //   'assets/images/brand_logo/sony Logo.png',
  //   'assets/images/brand_logo/miLogo.png',
  //   'assets/images/brand_logo/1009px-Apple_logo_black 1.png',
  //   'assets/images/brand_logo/Canon 1.png',
  //   'assets/images/brand_logo/huawei 2.png',
  // ];

  @override
  _BrandsState createState() => _BrandsState();
}

class _BrandsState extends State<Brands> {
  String _searchText = "";
  List names = [];
  List filteredNames = [];
  Icon _searchIcon = Icon(
    Icons.search_rounded,
    color: primaryColor.withOpacity(0.7),
  );
  TextEditingController _filter = TextEditingController();
  Widget _appBarSearchIcon = Container();

  BrandsState() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filteredNames = names;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  void initState() {
    filteredNames = widget.brandMap.values.toList();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    names = model_list;
    filteredNames = names;
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search_rounded) {
        this._searchIcon = Icon(
          Icons.start,
          size: 0,
        );
        debugPrint('TRue');

        this._appBarSearchIcon = Container(
          height: 32,
          width: MediaQuery.of(context).size.width / 1.4,
          decoration: BoxDecoration(
              color: Color(0xff515151).withOpacity(0.8),
              borderRadius: BorderRadius.circular(5)),
          padding: EdgeInsets.only(
            left: 14,
          ),
          child: new TextField(
            textAlignVertical: TextAlignVertical(y: 0.6),
            controller: _filter,
            style: TextStyle(color: primaryColor, fontSize: 12),
            decoration: new InputDecoration(
                border: InputBorder.none,
                suffixIcon: GestureDetector(
                  onTap: () {
                    debugPrint(_searchText);
                  },
                  child: new Icon(
                    Icons.search,
                    color: primaryColor,
                    size: 16,
                  ),
                ),
                hintText: 'Поиск...',
                hintStyle: TextStyle(
                    color: primaryColor.withOpacity(0.5), fontSize: 12)),
          ),
        );
        debugPrint(_appBarSearchIcon.toString());
      } else {
        debugPrint('false');
        this._searchIcon = new Icon(
          Icons.search_rounded,
          color: primaryColor,
          size: 16,
        );
        this._appBarSearchIcon = Container();
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height / 1,
        margin: const EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            // AppbarWidget(appBarTitle: 'Меню'),
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
                            'Меню',
                            style: TextStyle(color: primaryColor, fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/icons/korzina Icon.png'),
                          _appBarSearchIcon,
                          InkWell(
                              onTap: () => _searchPressed(), child: _searchIcon)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 26,
            ),
            const Text(
              'Бренды',
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.w600, color: textColor),
            ),
            ConstrainedBox(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height / 1.4,
                    maxWidth: MediaQuery.of(context).size.width / 1.1),
                child: _buildList())
          ],
        ),
      ),
    );
  }

  Widget _buildList() {
    if (!(_searchText.isEmpty)) {
      List tempList = [];
      for (int i = 0; i < model_list.length; i++) {
        if (filteredNames[i]
            .toLowerCase()
            .contains(_searchText.toLowerCase())) {
          tempList.add(filteredNames[i]);
        }
      }
      filteredNames = tempList;
    }
    return SizedBox(
      width: 400,
      height: 700,
      child: GridView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(10),
        itemCount: names == null ? model_list.length : filteredNames.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryPage(
                    title: '${model_list[index].title}',
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
                    '${model_list[index].image}',
                    height: 10,
                  )),
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 4.5 / 2),
      ),
    );
  }

// Widget brandsGrid(context) {
//   return GridView.builder(
//     shrinkWrap: true,
//     padding: const EdgeInsets.all(10),
//     itemCount: filteredNames.length,
//     itemBuilder: (context, index) {
//       return InkWell(
//         onTap: () => Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => CategoryPage(
//                 title: '${widget.brandMap.values.toList()[index]}',
//               ),
//             )),
//         child: Container(
//           height: 73,
//           margin: const EdgeInsets.all(5),
//           decoration: BoxDecoration(
//             color: backgroundLogoColor,
//             borderRadius: BorderRadius.circular(8),
//           ),
//           child: ConstrainedBox(
//               constraints: const BoxConstraints(maxHeight: 1),
//               child: Image.asset(
//                 '${widget.brandMap.keys.toList()[index]}',
//                 height: 10,
//               )),
//         ),
//       );
//     },
//     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//         crossAxisCount: 2, childAspectRatio: 4.5 / 2),
//   );
// }
}
