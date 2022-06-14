// import 'dart:html';

import 'package:bestir/provider/category_provider.dart';
import 'package:bestir/screens/about/about.dart';
import 'package:bestir/screens/checkout/checkout.dart';
import 'package:bestir/screens/login/login.dart';
import 'package:bestir/screens/profile/profilescreen.dart';
import 'package:bestir/widgets/detailscreen.dart';
import 'package:bestir/widgets/notification_button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bestir/widgets/listproducts.dart';
import 'package:bestir/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bestir/model/product.dart';
import 'package:provider/provider.dart';
import 'package:bestir/model/usermodel.dart';
import 'package:bestir/screens/addProduct/addproduct.dart';

import '../../provider/product_provider.dart';

List<String> images = [
  "https://s2.glbimg.com/j4p_HCROAOVDkZf5EyP-3cqsmsE=/620x430/e.glbimg.com/og/ed/f/original/2020/02/21/skyscrape.jpg",
  "https://unifardas.pt/wp-content/uploads/elementor/thumbs/blusao-para-roupa-de-inverno-unifardas-pcwoyzmf6t5obc90113e96316woidls9d3ficjfe6g.png",
  "https://www.unitedboutiques.com/wp-content/uploads/2021/09/e3bd8a70-05fc-11ec-8975-8b400f3a51e7.jpg"
];

class HomeScreeen extends StatefulWidget {
  HomeScreeen({Key? key}) : super(key: key);

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

late CategoryProvider categoryprovider;
late ProductProvider productprovider;

var featuredSnapShot;
var newAchivesSnapShot;
late double height, width;
bool homeColor = true;

bool checkoutColor = false;

bool aboutColor = false;

bool contactUsColor = false;
bool profileColor = false;
late MediaQueryData mediaQuery;

class _HomeScreeenState extends State<HomeScreeen> {
  Widget _buildCategoryProduct(String image) {
    return CircleAvatar(
      maxRadius: 35, //36
      backgroundColor: Colors.black,
      backgroundImage: AssetImage("assets/$image"),
    );
  }

  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = productprovider.userModelList;
    return Column(
        children: userModel.map((e) {
      if (e.role == "store") {
        return Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(
                e.userName!,
                style: TextStyle(color: Colors.black),
              ),
              currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/userImage.png")),
              decoration: BoxDecoration(color: Color(0xfff2f2f2)),
              accountEmail:
                  Text(e.userEmail!, style: TextStyle(color: Colors.black)),
            ),
            Container(
              child: ListTile(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (ctx) => AddProduct()));
                },
                leading: Icon(Icons.my_library_add),
                title: Text("Add Product"),
              ),
            ),
          ],
        );
      }
      return UserAccountsDrawerHeader(
        accountName: Text(
          e.userName!,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: AssetImage("assets/userImage.png")),
        decoration: BoxDecoration(color: Color(0xfff2f2f2)),
        accountEmail: Text(e.userEmail!, style: TextStyle(color: Colors.black)),
      );
    }).toList());
  }

  Widget _buildMyDrawer() {
    User? currentUser = FirebaseAuth.instance.currentUser;
    List<UserModel> userModel = productprovider.userModelList;

    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactUsColor = false;
                checkoutColor = false;
                aboutColor = false;
                profileColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomeScreeen()));
            },
            leading: Icon(Icons.home),
            title: Text("Home"),
          ),
          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                aboutColor = false;
                contactUsColor = false;
                homeColor = false;
                profileColor = true;
                checkoutColor = false;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ProfileScreen(),
                ),
              );
            },
            leading: Icon(Icons.info),
            title: Text("Profile"),
          ),
          ListTile(
            selected: checkoutColor,
            onTap: () {
              setState(() {
                checkoutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => CheckOut()));
            },
            leading: Icon(Icons.shopping_cart),
            title: Text("Checkout"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                checkoutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => About()));
            },
            leading: Icon(Icons.info),
            title: Text("About"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: Icon(Icons.exit_to_app),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
      ),
      items: images
          .map((item) => Container(
                margin: EdgeInsets.all(5.0),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCategory() {
    List<Product> shirts = categoryprovider.getShirList;
    List<Product> dress = categoryprovider.getDressList;
    List<Product> watch = categoryprovider.getWatchList;
    List<Product> cap = categoryprovider.getCapList;
    List<Product> shoes = categoryprovider.getShoesList;

    return Column(
      children: <Widget>[
        Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              Text(
                "Categories",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        // ignore: sized_box_for_whitespace
        Container(
          height: 60,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (ctx) =>
                            ListProduct(name: "Shoes", snapShot: shoes)),
                  );
                },
                child: _buildCategoryProduct("catsapatilha.jpg"),
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) =>
                              ListProduct(name: "Dress", snapShot: dress)),
                    );
                  },
                  child: _buildCategoryProduct("catVestido.jpg")),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                                name: "Shirt",
                                snapShot: shirts,
                              )),
                    );
                  },
                  child: _buildCategoryProduct("cattshirt.png")),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) =>
                              ListProduct(name: "Watches", snapShot: watch)),
                    );
                  },
                  child: _buildCategoryProduct("catwatch.jpg")),
              GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) =>
                              ListProduct(name: "Cap", snapShot: cap)),
                    );
                  },
                  child: _buildCategoryProduct("catcap.jpg")),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatured() {
    List<Product> featureProduct;
    List<Product> homeFeatureProduct;
    homeFeatureProduct = productprovider.getHomeFeaturedList;
    featureProduct = productprovider.getFeaturedList;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              "Featured",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (ctx) => ListProduct(
                          name: "Featured", snapShot: featureProduct)),
                );
              },
              child: const Text(
                "View more",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
        Row(
            children: homeFeatureProduct.map((e) {
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
                            description: e.description,
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
                          description: e.description,
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
        }).toList()),
      ],
    );
  }

  Widget _buildNewAchives() {
    List<Product> newAchivesProduct = productprovider.getHomeAchivesList;
    return Column(
      children: <Widget>[
        Container(
          height: 50,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    "New Arrivals",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (ctx) => ListProduct(
                                name: "New Arrivals",
                                snapShot: newAchivesProduct)),
                      );
                    },
                    child: const Text(
                      "View more",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
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
                  children: productprovider.getHomeAchivesList.map((e) {
                    return Row(
                      children: <Widget>[
                        GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (ctx) => DetailScreen(
                                    image: e.name,
                                    price: e.price,
                                    name: e.image,
                                    description: e.description,
                                  ),
                                ),
                              );
                            },
                            child: SingleProduct(
                                image: e.name, price: e.price, name: e.image)),
                      ],
                    );
                  }).toList(),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }

  bool homeColor = false;

  bool cartColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    categoryprovider = Provider.of<CategoryProvider>(context);
    categoryprovider.getShirtData();
    categoryprovider.getDressData();
    categoryprovider.getCapData();
    categoryprovider.getShoesData();
    categoryprovider.getWatchData();
    productprovider = Provider.of<ProductProvider>(context);
    productprovider.getFeatureData();
    productprovider.getNewAchivesData();
    productprovider.getHomeFeatureData();
    productprovider.getHomeAchivesData();
    productprovider.getUserData();
    //getStoreUser();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.white,
        key: _key,
        drawer: _buildMyDrawer(),
        appBar: AppBar(
          title: const Text("BESTIR",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.black,
            ),
            onPressed: () {
              ///////////////////////////////??????????
              _key.currentState?.openDrawer();
            },
          ),
          actions: <Widget>[
            // IconButton(
            //   icon: const Icon(Icons.search, color: Colors.black),
            //   onPressed: () {},
            // ),
            NotificationButton(),
          ],
        ),

        //featuredproducts
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Container(
                color: Colors.white,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _buildImageSlider(),
                        _buildCategory(),
                        const SizedBox(
                          height: 10,
                        ),
                        _buildFeatured(),
                        _buildNewAchives(),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
