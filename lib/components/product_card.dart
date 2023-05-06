import 'package:promat/constant/constant.dart';
import 'package:promat/model/product.dart';
import 'package:promat/view/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  Product product;
  // ignore: use_key_in_widget_constructors
  ProductCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: 8.allP,
      child: GrockContainer(
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              transitionDuration: const Duration(milliseconds: 500),
              pageBuilder: (_, __, ___) => ProductDetail(
                product: product,
              ),
            ),
          );
        },
        width: 150,
        decoration: BoxDecoration(
            borderRadius: 10.allBR,
            color: Constant.white,
            boxShadow: const [
              BoxShadow(color: Colors.black26, blurRadius: 8),
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 150,
              child: Center(
                child: Hero(
                  tag: product.image,
                  child: Image.asset(
                    product.image,
                    height: 130,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: 10.horizontalP,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    product.title,
                    style: const TextStyle(fontSize: 15),
                  )),
                ],
              ),
            ),
            Padding(
              padding: [10, 5].horizontalAndVerticalP,
              child: Text(
                "${product.price} ₺",
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
