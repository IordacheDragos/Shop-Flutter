import 'package:flutter/material.dart';
import 'package:invat/homescreenprovider.dart';
import 'package:invat/shoppageprovider.dart';
import 'product.dart';
import 'package:provider/provider.dart';
import 'shoppageprovider.dart';
import 'auth.dart';
import 'main.dart';

class ShopPage extends StatelessWidget {
  final Autentificare _auth = new Autentificare();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ShopPageProvider>(
      create: (context) => ShopPageProvider(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            home: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.black,
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: 35,
                          child: IconButton(
                              icon: Icon(Icons.cancel, size: 30),
                              onPressed: () {
                                _auth.signOut();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyApp()));
                              }),
                        ),
                        Text(
                          'Logout',
                          style: TextStyle(fontSize: 15, color: Colors.white),
                        ),
                      ],
                    ),
                    Text('Shop',
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    Column(
                      children: [
                        Container(
                          child: Consumer<ShopPageProvider>(
                            builder: (context, provider, child) {
                              return Stack(children: [
                                IconButton(
                                  icon: Icon(Icons.shopping_cart, size: 30),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      context: context,
                                      builder: (context) {
                                        return ListView(
                                          padding: EdgeInsets.all(5),
                                          children: [
                                            // Text(provider.lizt.toString()),
                                            Align(
                                                alignment: Alignment.center,
                                                child: Text(
                                                  'Total price: ' +
                                                      Provider.of<ShopPageProvider>(
                                                              context)
                                                          .pret
                                                          .toString() +
                                                      "€",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                            ...provider.lizt
                                          ],
                                        );
                                      },
                                    );
                                  },
                                ),
                                Text(
                                    Provider.of<ShopPageProvider>(context)
                                        .lizt
                                        .length
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.redAccent,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ]);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              body: MyShopPage(),
            ),
          );
        },
      ),
    );
  }
}

class MyShopPage extends StatefulWidget {
  @override
  _MyShopPageState createState() => _MyShopPageState();
}

class _MyShopPageState extends State<MyShopPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          new Expanded(
            child: Consumer<ShopPageProvider>(
              builder: (context, provider, child) {
                return Builder(
                  builder: (BuildContext context) {
                    final pret = Provider.of<ShopPageProvider>(context).pret;
                    return ListView(
                      children: [
                        Product(Colors.red, 'red', 2, schimbare, stergere),
                        Product(
                            Colors.blueAccent, 'Blue', 6, schimbare, stergere),
                        Product(Colors.purpleAccent, 'Purple', 7, schimbare,
                            stergere),
                        Product(Colors.greenAccent, 'Green', 12, schimbare,
                            stergere),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void schimbare(Product x, BuildContext context) {
  x.stare = 'SELL';
  Provider.of<ShopPageProvider>(context, listen: false).addToCart(x);
  Provider.of<ShopPageProvider>(context, listen: false).pretul_creste(x.pretz);
}

void stergere(BuildContext context) {
  dynamic temp = Provider.of<ShopPageProvider>(context, listen: false);
  for (int i = 0;
      i < Provider.of<ShopPageProvider>(context, listen: false).lizt.length;
      i++) {
    if (Provider.of<ShopPageProvider>(context, listen: false).lizt[i] ==
        context.findAncestorWidgetOfExactType<Product>()) {
      Provider.of<ShopPageProvider>(context, listen: false).pretul_scade(
          Provider.of<ShopPageProvider>(context, listen: false).lizt[i].pretz);
      Provider.of<ShopPageProvider>(context, listen: false).removeFromCart(i);
    }
  }
}
