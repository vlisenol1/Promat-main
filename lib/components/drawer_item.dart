import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem(
      {Key? key,
      required this.name,
      required this.icon,
      required this.onPressed,
      required this.style})
      : super(key: key);

  final String name;
  final IconData icon;
  final Function() onPressed;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Icon(
              icon,
              size: 15,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 18, color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
