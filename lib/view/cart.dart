import 'package:promat/components/custom_button.dart';
import 'package:promat/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:grock/grock.dart';
import 'package:awesome_card/awesome_card.dart';
import 'dart:math' as math;

enum SingingCharacter { lafayette, jefferson }

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  bool isChecked = false;
  String cardNumber = '';
  String cardHolderName = '';
  String expiryDate = '';
  String cvv = '';
  bool showBack = false;

  late FocusNode _focusNode;
  TextEditingController cardNumberCtrl = TextEditingController();
  TextEditingController expiryFieldCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Row(mainAxisAlignment: MainAxisAlignment.end, children: const [
          Text(
            'Bakiyeniz : 75 ₺',
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: 18, color: Colors.black),
          ),
        ]),
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: [10, 30].horizontalAndVerticalP,
        children: [
          Container(
            margin: 20.horizontalP,
            padding: [18, 12].horizontalAndVerticalP,
            decoration:
                BoxDecoration(color: Colors.blue, borderRadius: 10.allBR),
            child: const Center(
              child: Text(
                "İstasyonumuza tekrar bekleriz.",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          ListView.separated(
            itemCount: 2,
            shrinkWrap: true,
            padding: 20.verticalP,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                padding: 10.allP,
                decoration: BoxDecoration(
                    color: Constant.white,
                    borderRadius: 10.allBR,
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 15,
                        color: Colors.black12,
                      )
                    ]),
                child: IntrinsicHeight(
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          "assets/images/kuruyemis.png",
                          width: Grock.width * 0.3,
                          height: Grock.width * 0.3,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Lüx Kuruyemiş",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.bold),
                            ),
                            const Text(
                              "35 ₺",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                const Text(
                                  "Miktar",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                quantityButton(
                                    icon: Icons.remove, onTap: () {}),
                                Padding(
                                  padding: 7.horizontalP,
                                  child: const Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                quantityButton(icon: Icons.add, onTap: () {}),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.clear_sharp))
                      ]),
                ),
              );
            },
          ),
          Padding(
            padding: 20.onlyBottomP,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Toplam",
                  style: _style,
                ),
                Text(
                  "70 ₺",
                  style: _style,
                ),
              ],
            ),
          ),
          CustomButton(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12))),
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, setState) =>
                            FractionallySizedBox(
                          heightFactor: 0.85,
                          child: SingleChildScrollView(
                            child: Column(
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                CreditCard(
                                  width: height / 2.5,
                                  cardNumber: cardNumber,
                                  cardExpiry: expiryDate,
                                  cardHolderName: cardHolderName,
                                  cvv: cvv,
                                  textExpDate: "Geçerlilik Tarihi",
                                  textName: "Kart Sahibi",
                                  textExpiry: "A/Y",
                                  bankName: '',
                                  showBackSide: showBack,
                                  frontBackground: CardBackgrounds.black,
                                  backBackground: CardBackgrounds.white,
                                  showShadow: true,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: TextFormField(
                                        controller: cardNumberCtrl,
                                        decoration: const InputDecoration(
                                            hintText: 'Kart Numarası'),
                                        maxLength: 16,
                                        onChanged: (value) {
                                          final newCardNumber = value.trim();
                                          var newStr = '';
                                          // ignore: prefer_const_declarations
                                          final step = 4;

                                          for (var i = 0;
                                              i < newCardNumber.length;
                                              i += step) {
                                            newStr += newCardNumber.substring(
                                                i,
                                                math.min(i + step,
                                                    newCardNumber.length));
                                            if (i + step <
                                                newCardNumber.length) {
                                              newStr += ' ';
                                            }
                                          }

                                          setState(() {
                                            cardNumber = newStr;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: TextFormField(
                                        controller: expiryFieldCtrl,
                                        decoration: const InputDecoration(
                                            hintText: 'Geçerlilik tarihi'),
                                        maxLength: 5,
                                        onChanged: (value) {
                                          var newDateValue = value.trim();
                                          final isPressingBackspace =
                                              expiryDate.length >
                                                  newDateValue.length;
                                          final containsSlash =
                                              newDateValue.contains('/');

                                          if (newDateValue.length >= 2 &&
                                              !containsSlash &&
                                              !isPressingBackspace) {
                                            newDateValue =
                                                // ignore: prefer_interpolation_to_compose_strings
                                                newDateValue.substring(0, 2) +
                                                    '/' +
                                                    newDateValue.substring(2);
                                          }
                                          setState(() {
                                            expiryFieldCtrl.text = newDateValue;
                                            expiryFieldCtrl.selection =
                                                TextSelection.fromPosition(
                                                    TextPosition(
                                                        offset: newDateValue
                                                            .length));
                                            expiryDate = newDateValue;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: 'Kart Üzerindeki İsim'),
                                        onChanged: (value) {
                                          setState(() {
                                            cardHolderName = value;
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      child: TextFormField(
                                        decoration: const InputDecoration(
                                            hintText: 'CVV'),
                                        maxLength: 3,
                                        onChanged: (value) {
                                          setState(() {
                                            cvv = value;
                                          });
                                        },
                                        focusNode: _focusNode,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Checkbox(
                                            checkColor: Colors.white,
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                        ),
                                        const Text(
                                          'Hesabımdaki bakiyeden öde.',
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.black54),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 350,
                                  height: 70,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {},
                                    child: const Text(
                                      "Öde",
                                      style: TextStyle(
                                          color: Constant.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              text: "Satın Al")
        ],
      ),
    );
  }

  final TextStyle _style =
      const TextStyle(fontSize: 36, fontWeight: FontWeight.bold);

  Widget quantityButton({required IconData icon, required Function onTap}) {
    return GrockContainer(
      onTap: onTap(),
      width: 20,
      height: 20,
      decoration: BoxDecoration(borderRadius: 4.allBR, color: Colors.blue),
      child: Center(
          child: Icon(
        icon,
        size: 20,
        color: Colors.black,
      )),
    );
  }
}
