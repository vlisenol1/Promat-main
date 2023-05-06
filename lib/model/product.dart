import 'package:flutter/material.dart';

class Product {
  String image;
  String title;
  bool isSaved;
  String descTitle;
  String descDetail;
  List<Color> colors;

  Product(
      {required this.image,
      required this.title,
      required this.isSaved,
      required this.descDetail,
      required this.colors,
      required this.descTitle});

  get price => null;
}
