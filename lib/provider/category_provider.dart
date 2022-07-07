import 'package:bestir/model/product.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryProvider with ChangeNotifier {
  List<Product> shirt = [];
  late Product shirtData;
  List<Product> dress = [];
  late Product dressData;
  List<Product> watch = [];
  late Product watchData;
  List<Product> jeans = [];
  late Product jeansData;
  List<Product> cap = [];
  late Product capData;
  List<Product> shoes = [];
  late Product shoesData;

  //shirt
  Future<void> getShirtData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("shirt")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(element["name"], element["image"],
            element["price"].toDouble(), element["description"]);
        newList.add(shirtData);
      },
    );
    shirt = newList;
    notifyListeners();
  }

  List<Product> get getShirList {
    return shirt;
  }

//dress
  Future<void> getDressData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("dress")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(element["name"], element["image"],
            element["price"].toDouble(), element["description"]);
        newList.add(shirtData);
      },
    );
    dress = newList;
    notifyListeners();
  }

  List<Product> get getDressList {
    return dress;
  }

  //watch
  Future<void> getWatchData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("watch")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(element["name"], element["image"],
            element["price"].toDouble(), element["description"]);
        newList.add(shirtData);
      },
    );
    watch = newList;
    notifyListeners();
  }

  List<Product> get getWatchList {
    return watch;
  }

  //shoes
  Future<void> getShoesData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("shoes")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(element["name"], element["image"],
            element["price"].toDouble(), element["description"]);
        newList.add(shirtData);
      },
    );
    shoes = newList;
    notifyListeners();
  }

  List<Product> get getShoesList {
    return shoes;
  }

  //cap
  Future<void> getCapData() async {
    List<Product> newList = [];
    QuerySnapshot shirtSnapShot = await FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("cap")
        .get();
    shirtSnapShot.docs.forEach(
      (element) {
        shirtData = Product(element["name"], element["image"],
            element["price"].toDouble(), element["description"]);
        newList.add(shirtData);
      },
    );
    cap = newList;
    notifyListeners();
  }

  List<Product> get getCapList {
    return cap;
  }
}
