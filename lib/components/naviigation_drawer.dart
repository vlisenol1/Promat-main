import 'package:flutter/material.dart';
import 'package:promat/_auth/welcome.dart';
import 'package:promat/components/drawer_item.dart';
import 'package:promat/view/nearest_pormat.dart';
import 'package:promat/view/remaining_balance.dart';
import 'package:promat/view/stock.dart';

class NavigationDrawer extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Drawer(
      width: width / 2,
      backgroundColor: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24.0, 80, 24, 0),
        child: Column(
          children: [
            headerWidget(),
            const SizedBox(
              height: 40,
            ),
            const Divider(
              thickness: 1,
              height: 10,
              color: Colors.white,
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
              style: const TextStyle(),
              name: 'Bakiye Yükle',
              icon: Icons.money,
              onPressed: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddBalance()))
              },
            ),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
                style: const TextStyle(),
                name: 'Stok Durumu',
                icon: Icons.info_outline,
                onPressed: () => {
                      Navigator.push(
                          (context),
                          MaterialPageRoute(
                              builder: ((context) => const Stock())))
                    }),
            const SizedBox(
              height: 30,
            ),
            DrawerItem(
                name: 'Yakınlardaki \nPromatlar',
                icon: Icons.location_on,
                style: const TextStyle(fontSize: 10),
                onPressed: () => {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyWidget(),
                          ))
                    }),
            const SizedBox(
              height: 30,
            ),
            const Divider(
              thickness: 1,
              height: 10,
              color: Colors.white,
            ),
            DrawerItem(
                style: const TextStyle(),
                name: 'Çıkış Yap',
                icon: Icons.logout,
                onPressed: () => {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const Welcome())),
                          (route) => false)
                    }),
          ],
        ),
      ),
    );
  }

  Widget headerWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 90,
                  )),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Text('Promat Kullanıcısı',
            style: TextStyle(fontSize: 14, color: Colors.white)),
        const SizedBox(
          height: 10,
        ),
        const Text(
          '+ 90 507 123 1234',
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ],
    );
  }
}
