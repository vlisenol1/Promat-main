import 'package:promat/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:grock/grock.dart';
import 'package:promat/view/cart.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  final Size preferredSize;

  CustomAppBar({
    Key? key,
  })  : preferredSize = const Size.fromHeight(55),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Constant.white,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Hello, Frank",
            style: TextStyle(
                letterSpacing: 2,
                color: Color.fromARGB(132, 26, 17, 52),
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
      leading: Transform.translate(
        offset: Offset(kDefaultPadding * 0.5, 0),
        child: IconButton(
          icon: Image.asset('assets/images/image_hand.png'),
          onPressed: () {},
        ),
      ),
    );
  }
}
