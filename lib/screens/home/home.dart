import 'package:bestir/provider/category_provider.dart';
import 'package:bestir/widgets/detailscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bestir/widgets/listproducts.dart';
import 'package:bestir/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:bestir/model/product.dart';
import 'package:provider/provider.dart';

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




class _HomeScreeenState extends State<HomeScreeen> {
  
  Widget _buildCategoryProduct(String image) {
    return CircleAvatar(
      maxRadius: 35,//36
      backgroundColor: Color.fromARGB(158, 110, 107, 109),
      backgroundImage: AssetImage("assets/$image"),
      
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text(
              "UserTest",
              style: TextStyle(color: Colors.black),
            ),
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage("assets/logouser.png"),
            ),
            accountEmail: Text("usertest@gmail.com",
                style: TextStyle(color: Colors.black)),
          ),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                cartColor = false;
                aboutColor = false;
                contactUsColor = false;
              });
            },
            leading: const Icon(Icons.home),
            title: const Text("Home"),
          ),
          ListTile(
            selected: cartColor,
            onTap: () {
              setState(() {
                cartColor = true;
                homeColor = false;
                aboutColor = false;
                contactUsColor = false;
              });
            },
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                homeColor = false;
                cartColor = false;
                contactUsColor = false;
              });
            },
            leading: const Icon(Icons.info),
            title: const Text("About"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                contactUsColor = true;
                homeColor = false;
                cartColor = false;
                aboutColor = false;
              });
            },
            leading: const Icon(Icons.phone),
            title: const Text("Contact us"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: const Icon(Icons.exit_to_app),
            title: const Text("Logout"),
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
                margin:EdgeInsets.all(5.0),
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                ),
              ))
          .toList(),
    );
  }

  Widget _buildCategory() {
    List<Product> shirts=categoryprovider.getShirList;
      List<Product> dress=categoryprovider.getDressList;
        List<Product> watch=categoryprovider.getWatchList;
          List<Product> cap=categoryprovider.getCapList;
            List<Product> shoes=categoryprovider.getShoesList;
       
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
              Text(
                "See All",
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
                    builder: (ctx) => ListProduct(name:"Shoes",
                    snapShot: shoes
                    )
                   ),
                  );
                },
                child: _buildCategoryProduct(
                  "catsapatilha.jpg"),
                 ), 
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(name:"Dress",
                    snapShot: dress 
                     )
                   ),
                 );
                },
                child: _buildCategoryProduct(
                  "catVestido.jpg")
                  ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name:"Shirt",
                       snapShot: shirts,
                   )
                    ),
                  );
                },
                child: _buildCategoryProduct(
                  "cattshirt.png")
                  ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(name:"Watches",
                    snapShot: watch
                     )
                    ),
                  );
                },
                child: _buildCategoryProduct(
                  "catwatch.jpg")
                  ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(name:"Cap",
                    snapShot: cap)
                    ),
                    );
                },
                child: _buildCategoryProduct(
                  "catcap.jpg")
                  ), 
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeatured() {

    List<Product> featureProduct;
    List<Product> homeFeatureProduct;
    homeFeatureProduct=productprovider.getHomeFeaturedList;
    featureProduct=productprovider.getFeaturedPiece;

           
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
                  builder: (ctx)=>ListProduct(
                name: "Featured", 
                snapShot: featureProduct)
                ),
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
          children:homeFeatureProduct.map((e){
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
                              name:e.image,
                              ),
                      ),
                    );
                                  },
                                  child: SingleProduct(
                             image: e.name,
                             price: e.price,
                              name:e.image,
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
    List<Product> newAchivesProduct=productprovider.getNewAchivesList;
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
                    "New Achives",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx)=>ListProduct(
                name: "New Achives", 
                snapShot: newAchivesProduct)
                ),
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
                             name: e.image),
                            ),
                          );
                                                  },
                           child: SingleProduct(
                            image: e.name,
                             price: e.price, 
                             name: e.image)
                             ),
                    // GestureDetector(
                    //     onTap: () {
                    //       Navigator.of(context).pushReplacement(
                    //         MaterialPageRoute(
                    //           builder: (ctx) => DetailScreen(
                    //         image: e.name, 
                    //         price: e.price,
                    //          name: e.image,),
                    //         ),
                    //       );
                    //     },
                    //     child: SingleProduct(
                    //         image: e.name, 
                    //         price: e.price,
                    //          name: e.image,
                    //          )
                    //          )
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
    categoryprovider=Provider.of<CategoryProvider>(context);
    categoryprovider.getShirtData();
    categoryprovider.getDressData();
    categoryprovider.getCapData();
    categoryprovider.getShoesData();
    categoryprovider.getWatchData();
    productprovider=Provider.of<ProductProvider>(context);
    productprovider.getFeatureData();
    productprovider.getNewAchivesData();
    productprovider.getHomeFeatureData();
    productprovider.getHomeAchivesData();

    return Scaffold(
      backgroundColor: Colors.white,
      key: _key,
      drawer: _buildDrawer(),
      appBar: AppBar(
        title: const Text("Home Page",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.grey,
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
          IconButton(
              icon: const Icon(Icons.search, color: Colors.black),
              onPressed: () {}),
        ],
      ),

      //featuredproducts
      body:Container(
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
                  )
                  );
                }
            }
    
  
