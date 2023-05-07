import 'package:flutter/material.dart';

class Product {
  String image;
  String title;
  bool isSaved;

  Product({
    required this.image,
    required this.title,
    required this.isSaved,
  });

  get price => null;
}
