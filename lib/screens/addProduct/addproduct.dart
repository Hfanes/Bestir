import 'package:bestir/provider/category_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../home/home.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  final controller = TextEditingController();

  final TextEditingController cname = TextEditingController();
  final TextEditingController cdes = TextEditingController();
  final TextEditingController cprice = TextEditingController();
  final TextEditingController cimage = TextEditingController();

  //const AddProduct({Key? key}) : super(key: key);

  Future createCap(
      {required String name,
      required String description,
      required double price,
      required String image}) async {
    final docProduct = FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("cap")
        .doc();
    final json = {
      'name': name,
      "price": price,
      "image": image,
      "description": description
    };
    await docProduct.set(json);
  }

  Future createDress(
      {required String name,
      required String description,
      required double price,
      required String image}) async {
    final docProduct = FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("dress")
        .doc();
    final json = {
      'name': name,
      "price": price,
      "image": image,
      "description": description
    };
    await docProduct.set(json);
  }

  Future createShirt(
      {required String name,
      required String description,
      required double price,
      required String image}) async {
    final docProduct = FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("shirt")
        .doc();
    final json = {
      'name': name,
      "price": price,
      "image": image,
      "description": description
    };
    await docProduct.set(json);
  }

  Future createJeans(
      {required String name,
      required String description,
      required double price,
      required String image}) async {
    final docProduct = FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("jeans")
        .doc();
    final json = {
      'name': name,
      "price": price,
      "image": image,
      "description": description
    };
    await docProduct.set(json);
  }

  Future createShoes(
      {required String name,
      required String description,
      required double price,
      required String image}) async {
    final docProduct = FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("shoes")
        .doc();
    final json = {
      'name': name,
      "price": price,
      "image": image,
      "description": description
    };
    await docProduct.set(json);
  }

  Future createWatch(
      {required String name,
      required String description,
      required double price,
      required String image}) async {
    final docProduct = FirebaseFirestore.instance
        .collection("category")
        .doc("CQaOOiVnrpTB9n0nPRKj")
        .collection("watch")
        .doc();
    final json = {
      'name': name,
      "price": price,
      "image": image,
      "description": description
    };
    await docProduct.set(json);
  }

  String dropdownvalue = 'Category';

  // List of items in our dropdown menu
  var items = [
    'Category',
    'Cap',
    'Dress',
    'Jeans',
    'Shirt',
    'Shoes',
    'Watch',
  ];

  Widget texts() {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add Product"),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => HomeScreeen(),
                ),
              );
            },
          ),
        ),
        body: Container(
            height: 900,
            child: ListView(children: <Widget>[
              TextFormField(
                controller: cdes,
                decoration: const InputDecoration(hintText: "Description"),
              ),
              TextFormField(
                controller: cname,
                decoration: const InputDecoration(hintText: "Name"),
              ),
              TextFormField(
                controller: cprice,
                decoration: const InputDecoration(hintText: "Price"),
              ),
              TextFormField(
                controller: cimage,
                decoration: const InputDecoration(hintText: "Image"),
              ),
              ElevatedButton(
                  onPressed: () {
                    createCap(
                        name: cname.text,
                        description: cdes.text,
                        price: double.parse(cprice.text),
                        image: cimage.text);
                  },
                  child: Text("Add Cap")),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18.0),
        title: Text("Add Product"),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (ctx) => HomeScreeen(),
              ),
            );
          },
        ),
      ),
      body: Container(
        height: 900,
        child: ListView(children: <Widget>[
          TextFormField(
            textAlign: TextAlign.center,
            controller: cdes,
            decoration: const InputDecoration(hintText: "Description"),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            controller: cname,
            decoration: const InputDecoration(hintText: "Name"),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            controller: cprice,
            decoration: const InputDecoration(hintText: "Price"),
          ),
          TextFormField(
            textAlign: TextAlign.center,
            controller: cimage,
            decoration: const InputDecoration(hintText: "Image"),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    print(dropdownvalue);
                  });
                },
              ),
            ],
          ),
          ElevatedButton(
              onPressed: () {
                if (dropdownvalue == "Cap") {
                  print("cap");
                  createCap(
                      name: cname.text,
                      description: cdes.text,
                      price: double.parse(cprice.text),
                      image: cimage.text);
                } else if (dropdownvalue == "Dress") {
                  print("dress");
                  createDress(
                      name: cname.text,
                      description: cdes.text,
                      price: double.parse(cprice.text),
                      image: cimage.text);
                } else if (dropdownvalue == "Jeans") {
                  print("Jeans");
                  createJeans(
                      name: cname.text,
                      description: cdes.text,
                      price: double.parse(cprice.text),
                      image: cimage.text);
                } else if (dropdownvalue == "Shirt") {
                  print("Shirt");
                  createShirt(
                      name: cname.text,
                      description: cdes.text,
                      price: double.parse(cprice.text),
                      image: cimage.text);
                } else if (dropdownvalue == "Shoes") {
                  print("Shoes");
                  createShoes(
                      name: cname.text,
                      description: cdes.text,
                      price: double.parse(cprice.text),
                      image: cimage.text);
                } else if (dropdownvalue == "Watch") {
                  print("Watch");
                  createWatch(
                      name: cname.text,
                      description: cdes.text,
                      price: double.parse(cprice.text),
                      image: cimage.text);
                  controller.clear();
                }
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xff746bc9), // background
                onPrimary: Colors.white, // foreground
              ),
              child: Text("Add Product")),
        ]),
      ),
    );
  }
}
