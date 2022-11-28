import 'package:flutter/material.dart';
import 'package:badges/badges.dart';
import 'package:intl/intl.dart';
import 'package:intl/intl_browser.dart';

void main() {
  runApp(IntroProductApp());
}

class IntroProductApp extends StatefulWidget {
  const IntroProductApp({super.key});

  @override
  State<IntroProductApp> createState() => _IntroProductAppState();
}

class _IntroProductAppState extends State<IntroProductApp> {
  var _numberFormat = NumberFormat('00', 'en_US');
  int CountProduct = 0;
  int _selectColorModel = 1;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UI_practice',
      home: Scaffold(
        body: Container(
          color: Color.fromRGBO(59, 130, 173, 1),
          child: Column(children: <Widget>[
            const IconButtons(),
            const TopTexts(),
            Expanded(
                child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  const Bag_Image(),
                  Expanded(
                      child: Container(
                    alignment: Alignment.topLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                        ),
                        BottomRow1(),
                        BottmRow2(),
                        Passage(),
                        BottomRow3(),
                        BottomRow4(),
                      ],
                    ),
                  )),
                ],
              ),
            )),
          ]),
        ),
      ),
    );
  }

  Widget BottmRow2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: EdgeInsets.fromLTRB(15, 0, 0, 20),
            child: Row(children: [
              Container(
                width: 250,
                child: Stack(
                  children: [
                    CustomRadioBtn(Color.fromRGBO(59, 130, 173, 1), 1),
                    Positioned(
                      left: 30,
                      child:
                          CustomRadioBtn(Color.fromRGBO(250, 189, 118, 1), 2),
                    ),
                    Positioned(
                      left: 60,
                      child: CustomRadioBtn(Colors.grey, 3),
                    ),
                    const Positioned(
                      right: 10,
                      bottom: 2,
                      child: Text(
                        '12 cm',
                        style: TextStyle(
                            color: Color.fromRGBO(80, 80, 80, 1),
                            fontSize: 18,
                            height: 2,
                            fontWeight: FontWeight.w800),
                      ),
                    )
                  ],
                ),
              ),
            ])),
      ],
    );
  }

  Widget BottomRow3() {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 0, 40, 30),
      child: Row(children: [
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.fromLTRB(0, 0, 3, 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 0.5, color: Color.fromARGB(255, 80, 170, 244))),
          child: IconButton(
              onPressed: () {
                setState(() {
                  CountProduct = (CountProduct > 0) ? (CountProduct - 1) : 0;
                });
              },
              icon: const Icon(
                Icons.remove,
                color: Color.fromRGBO(80, 80, 80, 1),
                size: 35,
              )),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: Text(
            _numberFormat.format(CountProduct).toString(),
            style: const TextStyle(
                color: Color.fromRGBO(80, 80, 80, 1),
                fontSize: 20,
                height: 2,
                fontWeight: FontWeight.w600),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.fromLTRB(0, 0, 3, 3),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                  width: 0.5, color: Color.fromARGB(255, 80, 170, 244))),
          child: IconButton(
              onPressed: () {
                setState(() {
                  CountProduct += 1;
                });
              },
              icon: const Icon(
                Icons.add,
                color: Color.fromRGBO(80, 80, 80, 1),
                size: 35,
              )),
        ),
        const SizedBox(
          width: 120,
        ),
        Container(
          padding: EdgeInsets.fromLTRB(0, 0, 2, 1),
          decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 0.5, color: Colors.pink)),
          child: const IconButton(
              onPressed: null,
              icon: Icon(
                Icons.favorite,
                color: Colors.white,
                size: 35,
              )),
        ),
      ]),
    );
  }

  Widget CustomRadioBtn(Color ModelColor, int SelectColorModel) {
    return OutlinedButton(
        onPressed: () {
          setState(() {
            _selectColorModel = SelectColorModel;
          });
        },
        style: OutlinedButton.styleFrom(
            visualDensity: const VisualDensity(
                horizontal: VisualDensity.minimumDensity,
                vertical: VisualDensity.minimumDensity),
            shape: CircleBorder(),
            side: BorderSide(
                width: 1,
                color: (_selectColorModel == SelectColorModel)
                    ? ModelColor
                    : Colors.white)),
        child: Container(
          height: 14,
          width: 14,
          decoration: BoxDecoration(
              color: ModelColor, borderRadius: BorderRadius.circular(100)),
        ));
  }
}

class IconButtons extends StatelessWidget {
  const IconButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 20, 10, 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.arrow_back_sharp,
            color: Colors.white,
          ),
          Row(
            children: [
              const IconButton(
                  onPressed: null,
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                  )),
              IconButton(
                  onPressed: null,
                  icon: Badge(
                    position: BadgePosition.topEnd(end: -2, top: -2),
                    padding: EdgeInsets.all(4),
                    badgeColor: Colors.orange,
                    child: const Icon(
                      Icons.shopping_cart_outlined,
                      color: Colors.white,
                    ),
                  ))
            ],
          )
        ],
      ),
    );
  }
}

class TopTexts extends StatelessWidget {
  const TopTexts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      padding: EdgeInsets.fromLTRB(30, 0, 0, 20),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Aristocratic Hand Bag',
              style: TextStyle(color: Colors.white, fontSize: 12),
            ),
            Text('Office Code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 175),
            Text('Price',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                )),
            Text('\$234',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ))
          ]),
    );
  }
}

class Bag_Image extends StatelessWidget {
  const Bag_Image({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: -200,
      child: Image.asset(
        'assets/images/bag.png',
        width: 275,
        height: 275,
      ),
    );
  }
}

class BottomRow1 extends StatelessWidget {
  const BottomRow1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 20, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Color',
              style: TextStyle(
                  color: Color.fromRGBO(80, 80, 80, 1),
                  fontSize: 15,
                  height: 2,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 130,
            ),
            Text(
              'Size',
              style: TextStyle(
                  color: Color.fromRGBO(80, 80, 80, 1),
                  fontSize: 15,
                  height: 2,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ));
  }
}

class Passage extends StatelessWidget {
  const Passage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 20, 30),
        child: Text(
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the \nindustry\'s standard dummy text ever since. When an \nunknown printer took a galley. ',
          textAlign: TextAlign.left,
          style: TextStyle(
              color: Color.fromRGBO(80, 80, 80, 1),
              fontSize: 12,
              height: 2,
              fontWeight: FontWeight.w600),
        ));
  }
}

class BottomRow4 extends StatelessWidget {
  const BottomRow4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1.5, color: Color.fromRGBO(59, 130, 173, 1))),
            child: const IconButton(
              onPressed: null,
              icon: Icon(Icons.add_shopping_cart_outlined,
                  color: Color.fromRGBO(59, 130, 173, 1)),
            ),
          ),
          const SizedBox(
            width: 30,
          ),
          SizedBox(
            width: 250,
            height: 50,
            child: TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                  backgroundColor: Color.fromRGBO(59, 130, 173, 1),
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const Text('BUY NOW',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      height: 2,
                      fontWeight: FontWeight.w800)),
            ),
          )
        ],
      ),
    );
  }
}
