import 'package:promat/components/custom_button.dart';
import 'package:promat/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';
import 'package:promat/view/cart.dart';

import '../model/product.dart';

// ignore: must_be_immutable
class ProductDetail extends ConsumerStatefulWidget {
  Product product;
  ProductDetail({super.key, required this.product});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends ConsumerState<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            children: [image(), title(), colors(context), price2(), button()],
          ),
          appbar()
        ],
      ),
    );
  }

  Padding button() {
    return Padding(
      padding: 20.horizontalP,
      child: CustomButton(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const Cart(),
              ));
        },
        text: ("Sepete Ekle"),
      ),
    );
  }

  Padding price2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Fiyat",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          price()
        ],
      ),
    );
  }

  Text price() => Text(
        "${widget.product.price} ₺",
        style: Theme.of(context)
            .textTheme
            .headline5!
            .copyWith(fontWeight: FontWeight.bold),
      );

  Padding title() {
    return Padding(
      padding: [20, 40, 0, 0].paddingLTRB,
      child: Text(
        widget.product.title,
        style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }

  SafeArea appbar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(
                Icons.arrow_back,
                color: Constant.black,
                size: 32,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding colors(BuildContext context) {
    return Padding(
      padding: [20, 0, 20, 0].paddingLTRB,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(
          height: 0,
        ),
        Padding(
          padding: [20, 20, 20, 0].paddingLTRB,
        ),
        Text(
          widget.product.descTitle,
          style: _subTitle,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          widget.product.descDetail,
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          "Stok Adedi : 25",
          style: _subTitle,
        ),
      ]),
    );
  }

  SizedBox image() {
    return SizedBox(
      width: double.maxFinite,
      height: 320,
      child: Hero(
          tag: widget.product.image,
          child: Image.asset(
            widget.product.image,
            fit: BoxFit.contain,
          )),
    );
  }

  // ignore: prefer_final_fields
  TextStyle _subTitle = const TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.bold,
  );
}
