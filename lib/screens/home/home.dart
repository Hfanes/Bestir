import 'package:flutter/material.dart';

class HomeScreeen extends StatelessWidget {
  Widget _bluidFeaturedProduct(String name, double price, String image) {
    return Card(
      child: Container(
        height: 250,
        width: 150,
        color: Colors.cyan,
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage("assets/$name"))),
            ),
            Text(
              "\$ $price",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            Text(
              name,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  HomeScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text("Home Page"),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.blue[200],
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              ///////////////////////////////??????????
              _key.currentState?.openDrawer();
            },
          ),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.notifications_none, color: Colors.white),
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: () {}),
          ],
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(
                height: 25,
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const <Widget>[
                        Text(
                          "Featured",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "See all",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _bluidFeaturedProduct("relogio.jpg", 30.0, "relogio"),
                          _bluidFeaturedProduct(
                              "camisola.jpg", 20.0, "Camisola")
                        ],
                      )
                    ],
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          _bluidFeaturedProduct("ccalcas.jpg", 30.0, "calcas"),
                          _bluidFeaturedProduct("csapatos.png", 20.0, "sapatos")
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
