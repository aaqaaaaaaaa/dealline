import 'package:flutter/material.dart';

const Color primaryColor = Color(0xffFFC92F);
const Color backgroundColor = Color(0xff424242);
const Color textColor = Color(0xff2D2C2D);
const Color backgroundLogoColor = Color(0xffE9E9E9);
const Color pinColor = Color(0xff252525);
const Color appBarColor = Color(0xff434343);
const Color textFieldFillColor = Color(0xffF8F8F8);
const Color categoryBackgroundColor = Color(0xffE9E9E9);


ButtonStyle dialogButtonStyle=  ButtonStyle(
    fixedSize: MaterialStateProperty.all(Size(104,28)),
    backgroundColor:
    MaterialStateProperty.all(primaryColor),
    shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
        ),
    ),
);

Color gradientColor = const Color(0xff252525).withOpacity(0);
ButtonStyle keyboardButtonStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(backgroundColor),
    overlayColor: MaterialStateProperty.all(Colors.black12),
    elevation: MaterialStateProperty.all(0),
    shape: MaterialStateProperty.all(const RoundedRectangleBorder())
    // primary: buttonBackGroundColor,
    // shape: CircleBorder(),
    );
