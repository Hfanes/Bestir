import 'package:flutter/material.dart';

class HomeScreeen extends StatelessWidget {


  Widget _bluidFeaturedProduct(String name, double price, String image) {
    return Card(
      child: Container(
        height: 170,
        width: 150,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              height: 130,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.white,
                  image: DecorationImage(image: AssetImage("assets/$name"))),
            ),
            Text(
              "\$ $price",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.black),
            ),
            Text(
              image,
              style: const TextStyle(fontSize: 17, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
  
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
        drawer: const Drawer(),
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
                icon: const Icon(Icons.notifications_none, color: Colors.black),
                onPressed: () {}),
            IconButton(
                icon: const Icon(Icons.send, color: Colors.black),
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
                    height: 125,
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.search_outlined),
                            hintText: "Search Something",
                            border:OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))
                          ),
                        ),
                        ////////////////////
                        Container(
                          height:50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Text(
                                    "Featured",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
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
                              _bluidFeaturedProduct("relogio.jpg", 40.0, "Relogio"),
                              _bluidFeaturedProduct("camisola.jpg", 20.0, "Camisola")
                            ],
                          )
                        ],
                      ),
                    ],
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
                        Text("See all",
                         style: TextStyle(fontSize:17,fontWeight: FontWeight.bold),
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
                        Container(
                          height:50,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const <Widget>[
                                  Text(
                                    "New Achives",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "See all",
                                    style: TextStyle(
                                        fontSize: 18, fontWeight: FontWeight.bold),
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
                              _bluidFeaturedProduct("boxers.png", 15.0, "Boxers"),
                              _bluidFeaturedProduct("meias.png", 17.5, "Meias")
                            ],
                          )
                        ],
                      ),
                                ],
              ),
                      ],
                    ),
            ],
          ),
              ),
             

        );
  }
}
