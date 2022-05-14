import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation:0.0,
        leading: IconButton(
          icon:const Icon(
            Icons.arrow_back,
            color: Colors.white
            ),
            onPressed: (){},
            ) ,
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.notifications_none,
                  color: Colors.black,),
                  onPressed: (){},
                  ),
            ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                width: 350,
                child: Card(
                  child: Container(
                    padding: EdgeInsets.all(13),
                    child: Container(
                      height: 220,
                      decoration:const BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image:AssetImage("assets/macacao.png"))
                      )
                    ),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical:10,horizontal:10 ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:<Widget> [
                  Container(
                    height: 100,
                    child: Row(
                      children:<Widget> [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:const <Widget> [
                            Text("Woman Overalls",
                            style: TextStyle(
                              fontSize: 18
                                ),
                                ),
                                Text("\$ 30.0",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontStyle:FontStyle.italic,
                                  fontWeight: FontWeight.bold
                                ),
                                ),
                                Text("Description",
                            style: TextStyle(
                              fontSize: 18
                                ),
                                ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 130,
                    child: Wrap(
                      children:const  <Widget>[
                        Text("It is will bpoint of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, cMany desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident",
                        style: TextStyle(
                          fontSize: 15
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                   Text("Size",style: TextStyle(
                    fontSize: 18,
                  ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    width: 240,
                    child: Row(
                      children: <Widget>[
                        Container(
                          height:60,
                          width: 60,
                          color: Colors.grey[400],
                          child: const Center(
                            child:Text("S",
                            style: TextStyle(
                              fontSize: 18
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}