import 'package:promat/model/home_products_model.dart';
import 'package:promat/model/product.dart';
import 'package:flutter/material.dart';

class HomeRiverpod extends ChangeNotifier {
  List<String> campaigns = [
    "assets/images/macros.png",
    "assets/images/calories.png",
  ];

  int campaignsCurrentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  void setCampaignsIndex(int newPageValue) {
    campaignsCurrentIndex = newPageValue;
    notifyListeners();
  }

  List<Color> colorList = [];

  CalorieAndWaterPart hotDeals =
      CalorieAndWaterPart(categoryTitle: " ", products: [
    Product(
      image: "assets/images/fire.png",
      title: "Calories Burned ",
      isSaved: false,
    ),
    Product(
      image: "assets/images/waterdrop.png",
      title: "Hydration",
      isSaved: true,
    ),
  ]);
}
