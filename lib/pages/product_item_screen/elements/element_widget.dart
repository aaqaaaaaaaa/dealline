import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
