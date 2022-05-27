import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/product.dart';
class ProductProvider with ChangeNotifier{




  //Featured  
  List<Product> feature=[];
  late Product featureData;
  Future<void> getFeatureData() async{
    List<Product> newList=[];
    QuerySnapshot featureSnapShot=await FirebaseFirestore.instance
    .collection("products")
    .doc("iCKZZmOIi7qDoZJhriun")
    .collection("featureproduct")
    .get();
    featureSnapShot.docs.forEach((element) {
     featureData= Product(
        element["name"],
         element["image"], 
         element["price"].toDouble());
              newList.add(featureData);
     },
   );
   feature=newList;
  }
  List<Product> get getFeaturedList{
    return feature;
  }
   List<Product> get getFeaturedPiece{
    return List.from(feature);
  }

  //Featuredhome
  List<Product> homefeature=[];
 // late Product homeFeatureData;
  Future<void> getHomeFeatureData() async{
    List<Product> newList=[];
    QuerySnapshot featureSnapShot=await FirebaseFirestore.instance
    .collection("homefeature")
    .get();
    featureSnapShot.docs.forEach((element) {
     featureData= Product(
        element["name"],
         element["image"], 
         element["price"].toDouble());
              newList.add(featureData);
     },
   );
   homefeature=newList;
   notifyListeners();
  }
  List<Product> get getHomeFeaturedList{
    return homefeature;
  }

  //Achiveshome
  List<Product> homeAchives=[];
  //late Product homeAchivesData;
  Future<void> getHomeAchivesData() async{
    List<Product> newList=[];
    QuerySnapshot featureSnapShot=await FirebaseFirestore.instance
    .collection("homeachives")
    .get();
    featureSnapShot.docs.forEach((element) {
     featureData= Product(
        element["name"],
         element["image"], 
         element["price"].toDouble());
              newList.add(featureData);
     },
   );
   homeAchives=newList;
   notifyListeners();
  }
  List<Product> get getHomeAchivesList{
    return homeAchives;
  }

  

  //newAchives
    List<Product> newAchives=[];
  late Product newAchivesData;
  Future<void> getNewAchivesData() async{
    List<Product> newList=[];
    QuerySnapshot achivesSnapShot=await FirebaseFirestore.instance
    .collection("products")
    .doc("iCKZZmOIi7qDoZJhriun")
    .collection("newachives")
    .get();
    achivesSnapShot.docs.forEach((element) {
     featureData= Product(
        element["name"],
         element["image"], 
         element["price"].toDouble());
              newList.add(featureData);
     },
   );
   newAchives=newList;
   notifyListeners();
   
  }
  List<Product> get getNewAchivesList{
    return newAchives;
  }

  
}