import 'package:flutter/material.dart';

class CartModel{
  final String name;
  final String image;
  final double price;
  final int quantity;

  CartModel(this.name, this.image, this.price, this.quantity);
}