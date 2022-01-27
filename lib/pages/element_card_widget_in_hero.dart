import 'package:dealline/styles/styles.dart';
import 'package:dealline/widgets/card_grid_horizontal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:simple_star_rating/simple_star_rating.dart';

class CardElementWidgetInHero extends StatefulWidget {
  const CardElementWidgetInHero({Key? key}) : super(key: key);

  @override
  _CardElementWidgetInHeroState createState() =>
      _CardElementWidgetInHeroState();
}

class _CardElementWidgetInHeroState extends State<CardElementWidgetInHero> {
  @override
  Widget build(BuildContext context) {
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
            child: ListView.builder(
              itemCount: 1,
              itemBuilder: (context, index) => Hero(
                tag: CardList[index].isSelected == true,
                child: CardGridElementWidget(
                    price: CardList[index].price,
                    description: '${CardList[index].description}',
                    image: "${CardList[index].image}",
                    title: '${CardList[index].title}'),
              ),
            ),
          ),
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
        onPressed: () {},
      ),
    );
  }
}

class CardGridElementWidget extends StatefulWidget {
  const CardGridElementWidget(
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
  _CardGridElementWidgetState createState() => _CardGridElementWidgetState();
}

class _CardGridElementWidgetState extends State<CardGridElementWidget> {
  var rating = 3.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                height: 400,
                width: double.infinity,
                child: Image.asset(
                  '${widget.image}',
                  fit: BoxFit.fitHeight,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 55,
          ),
          Container(
            margin: EdgeInsets.only(left: 36),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${widget.title}',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                Row(
                  // mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      '${widget.price} сум',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7C7C7C)),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      '2 100 000 сум',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff7C7C7C)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 11,
                ),
                Row(
                  children: [
                    RatingBar.builder(
                        minRating: 1,
                        itemSize: 15,
                        itemBuilder: (context, index) => Icon(
                              Icons.star,
                              size: 12,
                              color: Colors.amber,
                            ),
                        onRatingUpdate: (rating) {
                          setState(() {
                            this.rating = rating;
                          });
                        }),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  '${widget.description}',
                  style: TextStyle(
                    color: Color(0xff858585),
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
