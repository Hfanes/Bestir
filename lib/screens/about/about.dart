import 'package:bestir/screens/home/home.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  String desc =
      "A Bestir é uma loja online global de moda e estilo de vida comprometida em tornar a beleza da moda acessível a todos. Usamos tecnologias de fabricação da melhor qualidade fornecendo sempre uma qualidade extraordinaria ao nosso cliente.Tentamos sempre reduzir o desperdício de peças permitindo fornecer uma variedade de produtos acessíveis aos nossos clientes. Temos o objetivo de vender em todos os paises do ,tendo o objetivo de chegar cada vez a mais clientes.";

  @override
  Widget build(BuildContext context) {
    Future<bool> redirectTo() async {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreeen();
      }));
      return true;
    }

    return WillPopScope(
      onWillPop: redirectTo,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.grey,
          title: const Text("About", style: TextStyle(color: Colors.black)),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
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
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: ListView(
            children: <Widget>[
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: const Image(
                  image: AssetImage("assets/welcome.png"),
                ),
              ),
              Text(
                desc,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
