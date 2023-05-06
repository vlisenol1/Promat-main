import 'package:promat/model/home_products_model.dart';
import 'package:promat/model/product.dart';
import 'package:flutter/material.dart';

class HomeRiverpod extends ChangeNotifier {
  List<String> campaigns = [
    "assets/images/cikolata.png",
    "assets/images/1.jpeg",
  ];

  int campaignsCurrentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  void setCampaignsIndex(int newPageValue) {
    campaignsCurrentIndex = newPageValue;
    notifyListeners();
  }

  List<Color> colorList = [];

  HomeProductsModel hotDeals =
      HomeProductsModel(categoryTitle: "Ürünlerimiz", products: [
    Product(
      image: "assets/images/bisküvi.png",
      title: "Ruffles Sade Patates Cipsi",
      price: 15,
      star: 4.9,
      descTitle: "Sade Patates Cipsi",
      descDetail: "Ruffles sade patates cipsinin eşsiz lezzetini tadın.",
      colors: [Colors.cyan, Colors.deepPurple, Colors.green],
      isSaved: false,
    ),
    Product(
      image: "assets/images/cikolata.png",
      title: "Eti Çikolatalı Gofret",
      price: 6,
      star: 4.7,
      descTitle: "Eti Çikolatalı Gofret",
      isSaved: true,
      descDetail: "Kendinizi küçük bir çikolata ile mutlu edebilirsiniz.",
      colors: [Colors.cyan, Colors.deepPurple, Colors.green],
    ),
  ]);
}
