// class Product {
//   String name;
//   String image;
//   double price;
//   Product({required this.image, required this.name, required this.price});
// }

import 'package:flutter/material.dart';

class Product {
  String name;
  String image;
  double price;
  String description;

  Product(this.name, this.image, this.price, this.description);
  // Product(@required this.name,@required this.image,@required this.price);
}
