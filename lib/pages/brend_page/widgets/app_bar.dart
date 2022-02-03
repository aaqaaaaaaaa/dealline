import 'package:dealline/pages/brend_page/data/data.dart';
import 'package:dealline/styles/styles.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
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
  void initState() {
    filteredNames = model_list.toList();
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    super.setState(fn);
    names = model_list;
    filteredNames = names;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 137,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(1),
        image: const DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/brand_logo/samsung-ecobubble-ww6000-review-the-ww80j6410cw-a-fantastic-washing-machine-3 1.png',
          ),
        ),
      ),
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
                      icon: Image.asset('assets/images/icons/ic_back.png')),
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
                  InkWell(onTap: () => _searchPressed(), child: _searchIcon)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
