import 'package:flutter/material.dart';

class SingleProduct extends StatelessWidget {
  final String image;
  final double price;
  final String name;

  SingleProduct(
      {Key? key, required this.image, required this.price, required this.name})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 170,
        width: 168,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              // padding: EdgeInsets.symmetric(vertical: 10),
              child: Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(
                      fit: BoxFit.fill, image: NetworkImage(name)),
                ),
              ),
            ),
            Text(
              "\$ ${price.toString()}",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            Text(
              image,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
