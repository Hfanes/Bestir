import 'package:bestir/model/product.dart';
import 'package:bestir/screens/home/home.dart';
import 'package:bestir/widgets/singleproduct.dart';
import 'package:flutter/material.dart';

import 'detailscreen.dart';

class ListProduct extends StatelessWidget {
  final String name;
  List<Product> snapShot;
  ListProduct({required this.name, required this.snapShot});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("List Products",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(
              icon: Icon(
                Icons.notifications_none,
              ),
              onPressed: () {}),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            name,
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 600,
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    childAspectRatio: 0.9,
                    //  crossAxisSpacing: 1,
                    //  mainAxisSpacing: 1,
                    //map(Closure: (dynamic) => SingleProduct))
                    children: snapShot.map((e) {
                      return Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (ctx) => DetailScreen(
                                        image: e.name,
                                        price: e.price,
                                        name: e.image,
                                      ),
                                    ),
                                  );
                                },
                                child: SingleProduct(
                                  image: e.name,
                                  price: e.price,
                                  name: e.image,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => DetailScreen(
                                      image: e.name,
                                      price: e.price,
                                      name: e.image,
                                    ),
                                  ),
                                );
                              },
                              child: SingleProduct(
                                image: e.name,
                                price: e.price,
                                name: e.image,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    //  => SingleProduct(
                    //    image: e.name,
                    //     price: e.price,
                    //     name: e.image
                    //       ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
