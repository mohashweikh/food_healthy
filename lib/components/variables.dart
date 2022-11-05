import 'package:flutter/material.dart';

/////COLOUR VARIABLES
const primary_Color = Color(0xffFFBC0E);
const backgroundColor = Color(0xfffff55);
const activeCardColor = primary_Color;
const inactiveCardColor = Color(0xFFFFD982);
/////////////////////

const adviceTextStyle = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.bold,
  color: Color(0xffFF0C9514),
);

Image assetImage(String assetName, double height, double width) {
  return Image.asset(
    'assets/$assetName',
    height: height,
    width: width,
  );
}

List<BoxShadow> boxShadow = [
  BoxShadow(
      color: Colors.black.withOpacity(0.2),
      spreadRadius: 2,
      blurRadius: 2,
      offset: Offset(3, 3))
];

///////////////BURGER ITEM COUNTERS
const bannerId = "ca-app-pub-6266109614428269/6766032054";
const appId = "ca-app-pub-6266109614428269~3401502110";
const appIdTest ='ca-app-pub-3940256099942544~3347511713';
const bannerIdTest ='ca-app-pub-3940256099942544/6300978111';

