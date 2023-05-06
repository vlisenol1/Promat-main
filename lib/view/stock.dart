import 'package:flutter/material.dart';

class Stock extends StatefulWidget {
  const Stock({super.key});

  @override
  State<Stock> createState() => _StockState();
}

class _StockState extends State<Stock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
        ),
        body: ListView(children: <Widget>[
          const Center(
              child: Text(
            'Stok Durumu',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          )),
          DataTable(
            columns: const [
              DataColumn(
                  label: Text('ID',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Kategori',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Ürün',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Stok',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold))),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text('1')),
                DataCell(Text('Cips')),
                DataCell(Text('Ruffles')),
                DataCell(Text('25')),
              ]),
              DataRow(cells: [
                DataCell(Text('5')),
                DataCell(Text('İçecek')),
                DataCell(Text('Redbull')),
                DataCell(Text('25')),
              ]),
              DataRow(cells: [
                DataCell(Text('10')),
                DataCell(Text('İçecek')),
                DataCell(Text('Coca Cola')),
                DataCell(Text('25')),
              ]),
              DataRow(cells: [
                DataCell(Text('15')),
                DataCell(Text('Bisküvi')),
                DataCell(Text('Nero')),
                DataCell(Text('25')),
              ]),
              DataRow(cells: [
                DataCell(Text('20')),
                DataCell(Text('Çikolata')),
                DataCell(Text('Eti Çikolatalı Gofret')),
                DataCell(Text('25')),
              ]),
              DataRow(cells: [
                DataCell(Text('25')),
                DataCell(Text('Kuruyemiş')),
                DataCell(Text('Lüx Kuruyemiş')),
                DataCell(Text('25')),
              ])
            ],
          ),
        ]));
  }
}
