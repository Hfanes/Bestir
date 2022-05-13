import 'package:bestir/screens/listProducts/listproducts.dart';
import 'package:bestir/widgets/singleproduct.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class HomeScreeen extends StatelessWidget {



  
Widget _buildCategoryProduct(String image) {
                      return CircleAvatar(
                      maxRadius: 36,
                       backgroundColor: const Color(0xff33dcfd ),
                       backgroundImage:AssetImage("assets/$image" ) ,
                    );
}



  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  HomeScreeen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        key: _key,
        drawer: const Drawer(
          
        ),
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
                          Container(
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

                            )
                              
                            
                          ),
                           Container(
                    height: 60,    
                    color: Colors.white,            
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children:const  <Widget>[
                         Text("Categories",
                         style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),
                         ),
                           Text(
                                    "See All",
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
                              SingleProduct(image:"relogio" , price: 40, name: "relogio.jpg"),
                              SingleProduct(image: "Camisola", price: 20, name: "camisola.jpg"),
                             
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
                              SingleProduct(image:"Boxers",price: 15.0, name:"boxers.png"),
                              SingleProduct(image:"Meias", price:17.5,name: "meias.png")
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
