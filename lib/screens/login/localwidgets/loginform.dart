import 'package:bestir/screens/home/home.dart';
import 'package:bestir/screens/signup/signup.dart';
import 'package:bestir/states/currentUser.dart';
import 'package:bestir/widgets/ourcontainer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  const OurLoginForm({Key? key}) : super(key: key);

  @override
  State<OurLoginForm> createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _loginUser(String email, String password, BuildContext context) async {
    CurretnUser _currentUser = Provider.of<CurretnUser>(context, listen: false);
    try {
      if (await _currentUser.loginUser(email, password)) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => HomeScreeen(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Incorret User"),
          duration: Duration(seconds: 2),
        ));
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
        child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Text(
            "Log In",
            style: TextStyle(
                color: Theme.of(context).secondaryHeaderColor,
                fontSize: 25.0,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextFormField(
          controller: _emailController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.alternate_email), hintText: "Email"),
        ),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.lock_outline), hintText: "Password"),
        ),
        const SizedBox(
          height: 20.0,
        ),
        ElevatedButton(
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 100),
            child: Text(
              "Log In",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
          ),
          onPressed: () {
            _loginUser(
                _emailController.text, _passwordController.text, context);
          },
        ),
        TextButton(
          child: const Text("Don´t have one?Sign UP"),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => OurSignUp(),
              ),
            );
          },
        )
      ],
    ));
  }
}
