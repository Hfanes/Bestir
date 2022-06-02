import 'package:bestir/model/cartmodel.dart';
import 'package:bestir/model/usermodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductProvider with ChangeNotifier {
  List<CartModel> cartModelList = [];
  List<CartModel> checkOutModelList = [];
  List<UserModel> userModelList = [];
  late UserModel userModel;
  late CartModel checkOutModel;

  late CartModel cartModel;
  void getCartdata(
      {required String name,
      required String image,
      required int quantity,
      required double price,
      required String size}) {
    cartModel = CartModel(name, image, price, quantity, size);

    cartModelList.add(cartModel);
  }

  List<CartModel> get getCartModelList {
    return List.from(cartModelList);
  }

  int get getCartModelListLength {
    return cartModelList.length;
  }

  Future<void> getUserData() async {
    List<UserModel> newList = [];

    User? currentUser = FirebaseAuth.instance.currentUser;
    QuerySnapshot userSnapShot =
        await FirebaseFirestore.instance.collection("User").get();
    userSnapShot.docs.forEach(
      (element) {
        if (currentUser?.uid == (element.data() as dynamic)["UserId"]) {
          userModel = UserModel(
              userAddress: (element.data() as dynamic)["UserAddress"],
              userImage: (element.data() as dynamic)["UserImage"],
              userEmail: (element.data() as dynamic)["UserEmail"],
              userGender: (element.data() as dynamic)["UserGender"],
              userName: (element.data() as dynamic)["UserName"],
              userPhoneNumber: (element.data() as dynamic)["UserNumber"]);
          newList.add(userModel);
        }
        userModelList = newList;
      },
    );
  }

  List<UserModel> get getUserModelList {
    return userModelList;
  }

  void deleteCheckoutProduct(int index) {
    checkOutModelList.removeAt(index);
    notifyListeners();
  }

  void clearCheckoutProduct() {
    checkOutModelList.clear();
    notifyListeners();
  }

  void getCheckOutData({
    required int quantity,
    required double price,
    required String name,
    required String size,
    required String image,
  }) {
    checkOutModel = CartModel(name, image, price, quantity, size);
    checkOutModelList.add(checkOutModel);
  }

  List<CartModel> get getCheckOutModelList {
    return List.from(checkOutModelList);
  }

  int get getCheckOutModelListLength {
    return checkOutModelList.length;
  }

  //Featured
  List<Product> feature = [];
  late Product featureData;
  Future<void> getFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("iCKZZmOIi7qDoZJhriun")
        .collection("featureproduct")
        .get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            element["name"], element["image"], element["price"].toDouble());
        newList.add(featureData);
      },
    );
    feature = newList;
  }

  List<Product> get getFeaturedList {
    return feature;
  }

  List<Product> get getFeaturedPiece {
    return List.from(feature);
  }

  //Featuredhome
  List<Product> homefeature = [];
  Future<void> getHomeFeatureData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot =
        await FirebaseFirestore.instance.collection("homefeature").get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            element["name"], element["image"], element["price"].toDouble());
        newList.add(featureData);
      },
    );
    homefeature = newList;
    notifyListeners();
  }

  List<Product> get getHomeFeaturedList {
    return homefeature;
  }

  //Achiveshome
  List<Product> homeAchives = [];
  Future<void> getHomeAchivesData() async {
    List<Product> newList = [];
    QuerySnapshot featureSnapShot =
        await FirebaseFirestore.instance.collection("homeachives").get();
    featureSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            element["name"], element["image"], element["price"].toDouble());
        newList.add(featureData);
      },
    );
    homeAchives = newList;
    notifyListeners();
  }

  List<Product> get getHomeAchivesList {
    return homeAchives;
  }

  //newAchives
  List<Product> newAchives = [];
  late Product newAchivesData;
  Future<void> getNewAchivesData() async {
    List<Product> newList = [];
    QuerySnapshot achivesSnapShot = await FirebaseFirestore.instance
        .collection("products")
        .doc("iCKZZmOIi7qDoZJhriun")
        .collection("newachives")
        .get();
    achivesSnapShot.docs.forEach(
      (element) {
        featureData = Product(
            element["name"], element["image"], element["price"].toDouble());
        newList.add(featureData);
      },
    );
    newAchives = newList;
    notifyListeners();
  }

  List<Product> get getNewAchivesList {
    return newAchives;
  }

  List<String> notificationList = [];

  void addNotification(String notification) {
    notificationList.add(notification);
  }

  int get getNotificationIndex {
    return notificationList.length;
  }
}
