import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bestir/model/cartmodel.dart';
import 'package:bestir/provider/product_provider.dart';
import 'package:bestir/screens/home/home.dart';
import 'package:bestir/widgets/checkout_singleproduct.dart';
import 'package:bestir/widgets/mybutton.dart';
import 'package:bestir/widgets/notification_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  TextStyle myStyle = TextStyle(
    fontSize: 18,
  );
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  late ProductProvider productProvider;

  Widget _buildBottomSingleDetail({String? startName, String? endName}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          startName!,
          style: myStyle,
        ),
        Text(
          endName!,
          style: myStyle,
        ),
      ],
    );
  }

  User? user;
  late double total;
  late List<CartModel> myList;

  Widget _buildButton() {
    return Column(
        children: productProvider.userModelList.map((e) {
      return Container(
        height: 50,
        child: MyButton(
          name: "Buy",
          onPressed: () {
            if (productProvider.getCheckOutModelList.isNotEmpty) {
              FirebaseFirestore.instance.collection("Order").add({
                "Product": productProvider.getCheckOutModelList
                    .map((c) => {
                          "ProductName": c.name,
                          "ProductPrice": c.price,
                          "ProductQuantity": c.quantity,
                          "ProductImage": c.image,
                          "Product Size": c.size,
                        })
                    .toList(),
                "TotalPrice": total.toStringAsFixed(2),
                "UserName": e.userName,
                "UserEmail": e.userEmail,
                "UserNumber": e.userPhoneNumber,
                "UserAddress": e.userAddress,
                "UserId": user?.uid,
              });
              setState(() {
                myList.clear();
              });

              productProvider.addNotification("Notification");
            } else {
              _scaffoldKey.currentState?.showSnackBar(
                SnackBar(
                  content: Text("No Item Yet"),
                ),
              );
            }
          },
        ),
      );
    }).toList());
  }

  @override
  void initState() {
    productProvider = Provider.of<ProductProvider>(context, listen: false);
    myList = productProvider.checkOutModelList;
    super.initState();
  }

  Future<bool> redirectTo() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreeen();
    }));
    return true;
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    double subTotal = 0;
    double discount = 3;
    double discountEuros;
    double shipping = 20;

    productProvider = Provider.of<ProductProvider>(context);
    productProvider.getCheckOutModelList.forEach((element) {
      subTotal += element.price * element.quantity;
    });

    discountEuros = discount / 100 * subTotal;
    total = subTotal + shipping - discountEuros;
    if (productProvider.checkOutModelList.isEmpty) {
      total = 0.0;
      discount = 0.0;
      shipping = 0.0;
    }

    return WillPopScope(
      onWillPop: redirectTo,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          centerTitle: true,
          title: Text("CheckOut Page", style: TextStyle(color: Colors.black)),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
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
          actions: <Widget>[
            NotificationButton(),
          ],
        ),
        bottomNavigationBar: Container(
          height: 70,
          width: 100,
          margin: EdgeInsets.symmetric(horizontal: 10),
          padding: EdgeInsets.only(bottom: 15),
          child: _buildButton(),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: ListView.builder(
                    itemCount: myList.length,
                    itemBuilder: (ctx, myIndex) {
                      return CheckOutSingleProduct(
                        index: myIndex,
                        size: myList[myIndex].size,
                        image: myList[myIndex].image,
                        name: myList[myIndex].name,
                        price: myList[myIndex].price,
                        quantity: myList[myIndex].quantity,
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      _buildBottomSingleDetail(
                        startName: "Subtotal",
                        endName: "\$ ${subTotal.toStringAsFixed(2)}",
                      ),
                      _buildBottomSingleDetail(
                        startName: "Discount",
                        endName: "${discount.toStringAsFixed(2)}%",
                      ),
                      _buildBottomSingleDetail(
                        startName: "Shipping",
                        endName: "\$ ${shipping.toStringAsFixed(2)}",
                      ),
                      _buildBottomSingleDetail(
                        startName: "Total",
                        endName: "\$ ${total.toStringAsFixed(2)}",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
