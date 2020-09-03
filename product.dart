import 'package:flutter/material.dart';
import 'shoppageprovider.dart';
import 'package:provider/provider.dart';

class Product extends StatelessWidget {
  Color color;
  String text;
  int _price = 0;
  String stare = 'BUY';
  String id;
  final Function f_buy;
  final Function f_sell;
  Product(this.color, this.text, this._price, this.f_buy, this.f_sell);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 15),
        Row(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
              width: 64,
              height: 64,
              color: color,
            ),
            Spacer(),
            Text(
              "Color " + text + " " + _price.toString() + "€",
              style: TextStyle(
                  fontSize: 26,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Spacer(),
            Builder(builder: (BuildContext context) {
              return Container(
                margin: EdgeInsets.fromLTRB(0, 0, 5, 0),
                child: RawMaterialButton(
                  onPressed: () {
                    if (stare == 'BUY') {
                      f_buy(
                          Product(color, text, _price, f_buy, f_sell), context);
                    } else if (stare == 'SELL') {
                      f_sell(context);
                    }
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    side: BorderSide(color: Colors.black, width: 1.5),
                  ),
                  child: Text(
                    stare,
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              );
            }),
          ],
        ),
        SizedBox(height: 15),
      ],
    );
  }

  int get pretz => _price;
}
