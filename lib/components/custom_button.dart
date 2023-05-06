import 'package:promat/constant/constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  String text;
  Function onTap;
  CustomButton({Key? key, required this.onTap, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            // ignore: deprecated_member_use
            primary: Colors.blue,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10))),
        onPressed: () => onTap(),
        child: Text(
          text,
          style: const TextStyle(
              color: Constant.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
