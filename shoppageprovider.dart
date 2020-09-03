import 'package:flutter/material.dart';
import 'product.dart';

class ShopPageProvider extends ChangeNotifier {
  static int price = 0;
  static List<Product> produse = [];

  void addToCart(Product temp) {
    produse.add(temp);
    notifyListeners();
  }

  void removeFromCart(int index) {
    produse.removeAt(index);
    notifyListeners();
  }

  void pretul_creste(int aux) {
    price += aux;
    notifyListeners();
  }

  void pretul_scade(int aux) {
    price -= aux;
    notifyListeners();
  }

  List<Product> get lizt => produse;
  int get pret => price;
}
