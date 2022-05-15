import 'package:bestir/widgets/detailscreen.dart';
import 'package:bestir/widgets/listproducts.dart';
import 'package:bestir/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeScreeen extends StatefulWidget {

  HomeScreeen({Key? key}) : super(key: key);

  @override
  State<HomeScreeen> createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {

  Widget _buildCategoryProduct(String image) {
                      return CircleAvatar(
                      maxRadius: 36,
                       backgroundColor: const Color(0xff33dcfd ),
                       backgroundImage:AssetImage("assets/$image" ) ,
                    );
}
  Widget _buildDrawer(){
    return Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children:  <Widget>[ 
             const  UserAccountsDrawerHeader(
                accountName: Text("UserTest",style: TextStyle(color: Colors.black),), 
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage("assets/logouser.png"),
                ),
                accountEmail: Text("usertest@gmail.com",style: TextStyle(color: Colors.black)),
                ),
                 ListTile(
                   selected: homeColor,
                  onTap: (){
                   setState(() {
                     homeColor=true;
                       cartColor=false;
                       aboutColor=false;
                       contactUsColor=false;
                   }); 
                  },
                  leading:const Icon(Icons.home),
                  title:const Text("Home"),
                ),
                 ListTile(
                   selected: cartColor,
                  onTap: (){
                    setState(() {
                      cartColor=true;
                       homeColor=false;
                       aboutColor=false;
                       contactUsColor=false;
                    });
                  },
                  leading:const Icon(Icons.shopping_cart),
                  title:const Text("Cart"),
                ),
                 ListTile(
                   selected: aboutColor,
                  onTap: (){
                    setState(() {
                      aboutColor=true;
                       homeColor=false;
                       cartColor=false;
                       contactUsColor=false;
                    });
                  },
                  leading:const Icon(Icons.info),
                  title:const Text("About"),
                ),
                ListTile(
                  selected: contactUsColor,
                  onTap: (){
                     setState(() {
                       contactUsColor=true;
                       homeColor=false;
                       cartColor=false;
                       aboutColor=false;
                    });
                  },
                  leading: const Icon(Icons.phone),
                  title: const Text("Contact us"),
                ),
                    ListTile(
                  onTap: (){},
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text("Logout"),
                ),
                

            ],
          ),




        );
  } 
  Widget _buildImageSlider(){
    return Container(
                            height: 240,
                            child: Carousel(
                              autoplay: true,
                              boxFit: BoxFit.fill,
                              showIndicator: false,
                              images: const [
                                AssetImage("assets/ccalcas.jpg"),
                                AssetImage("assets/csapatos.png"),
                                AssetImage("assets/ctshirt.jpg"),
                                AssetImage("assets/cchapeu.png"),
                              ],
                            ),  
                          );
  }
  Widget _buildCategory(){
    return Column(
      children: <Widget>[
               Container(
                    height: 60,    
                    color: Colors.white,            
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const  <Widget>[
                         Text("Categories",
                         style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),
                         ),
                           Text("See All",
                                    style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                                  ),
                    ],
                    ),
                  ),
                  Container(
                    height: 60,
                    child: Row(
                      children: <Widget>[
                       _buildCategoryProduct("CatSapatilha.png"),
                           _buildCategoryProduct("CatSapatilha.png"),
                                _buildCategoryProduct("CatSapatilha.png"),
                                     _buildCategoryProduct("CatSapatilha.png"),
                                          _buildCategoryProduct("CatSapatilha.png"),
                      ],
                    ),
                  ),
      ],
    );
  }


 bool homeColor=false;

 bool cartColor=false;

 bool aboutColor=false;

 bool contactUsColor=false;

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        key: _key,
          drawer: _buildDrawer(),
        appBar: AppBar(
          title: const Text("Home Page",style: TextStyle(color:Colors.black, fontWeight: FontWeight.bold)),
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
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Container(
                 
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
               
                  Column(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                         _buildImageSlider(),
                         _buildCategory(),
                  const SizedBox(
                    height: 10,                  
                  ),
                               Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:  <Widget>[
                                  const Text(
                                    "Featured",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                   GestureDetector(
                                     onTap: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>ListProduct(name:"Featured"),),);
                                     },
                                     child:const  Text("View more",
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold),
                                                                     ),
                                   ),
                                ],
                              ),
                          Row(
                            children: <Widget>[
                              GestureDetector(
                                  onTap: (){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx)=>DetailScreen( 
                                        image:"relogio.jpg" ,
                                          price: 40,
                                            name: "Relogio"),
                                    ),
                                    );
                                },
                                child: SingleProduct(
                                  image:"Relogio" ,
                                   price: 40,
                                    name: "relogio.jpg"),
                              ),
                              GestureDetector(
                                  onTap: (){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx)=>DetailScreen( 
                                        image: "camisola.jpg",
                                         price: 20, 
                                          name: "Camisola"),
                                    ),
                                    );
                                },
                                child: SingleProduct(image: "Camisola", price: 20, name: "camisola.jpg")),
                             
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  ////////////////
                 
                        Container(
                          height:50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children:   <Widget>[
                                  const Text(
                                    "New Achives",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                 GestureDetector(
                                   onTap: (){
                                     Navigator.of(context).pushReplacement(MaterialPageRoute(builder:(ctx)=>ListProduct(name:"New Achives"),
                                     ),
                                     );
                                   },
                                   child: const Text(
                                     "View more",
                                      style: TextStyle(
                                          fontSize: 18, fontWeight: FontWeight.bold),
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
                            children: <Widget>[  
                              GestureDetector(
                                  onTap: (){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx)=>DetailScreen( 
                                        image:"boxers.png",
                                        price: 15.0, 
                                        name:"Boxers"),
                                    ),
                                    );
                                },
                                child: SingleProduct(image:"Boxers",price: 15.0, name:"boxers.png")),
                              GestureDetector(
                                  onTap: (){
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (ctx)=>DetailScreen( 
                                        image:"meias.png",
                                         price:17.5,
                                         name: "Meias"),
                                    ),
                                    );
                                },
                                child: SingleProduct(image:"Meias", price:17.5,name: "meias.png"))
                            ],
                          )
                        ],
                      ),
                                ],
              ),
                      ],
                    ),

          ),

             

             ]
          )])
             )
              );
  }
}
