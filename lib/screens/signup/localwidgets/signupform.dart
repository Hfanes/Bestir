import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../states/currentUser.dart';
import '../../../widgets/ourcontainer.dart';
import '../signup.dart';


class OurSignUpForm extends StatefulWidget {
  const OurSignUpForm({Key? key}) : super(key: key);

  @override
  State<OurSignUpForm> createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {

  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =TextEditingController();

  void _signUpUser(String email,String password,BuildContext context)async {
    CurretnUser _currentUser=Provider.of<CurretnUser>(context,listen: false);
  try{
    if (await _currentUser.signUpUser(email, password)){
      Navigator.pop(context);
    }
  }catch(e){
    print(e);
    print("ERRO!");
  }
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
        child:Column(
          children: <Widget>[
            Padding(padding: const EdgeInsets.all(20),
              child:Text(
                "Sign Up",
                style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            TextFormField(
              controller: _userNameController,
              decoration:  const InputDecoration(
                  prefixIcon: Icon(Icons.person_outline),
                  hintText: "UserName" ),
            ),
            TextFormField(
              controller: _emailController,
              decoration:  const InputDecoration(
                  prefixIcon: Icon(Icons.alternate_email),
                  hintText: "Email" ),
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration:  const InputDecoration(
                  prefixIcon:Icon(Icons.lock_outline),
                  hintText: "Password" ),
            ),

            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration:  const InputDecoration(
                  prefixIcon: Icon(Icons.lock_open),
                  hintText: "Confirm Password" ),
            ),
            const SizedBox(height: 20.0,),
            ElevatedButton(
              child:const Padding(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child:Text(
                  "Sign Up",
                  style: TextStyle(
                    color : Colors.green,
                    fontWeight: FontWeight.bold,

                    fontSize: 15.0,
                  ),
                ),
              ),
              onPressed:(){
                if(_passwordController.text==_confirmPasswordController.text){
                  _signUpUser(_emailController.text,_passwordController.text,context);
                }else{
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Passwords are not the same"),
                    duration:Duration(seconds: 2) ,
                    )
                  );
                }
              },
            ),

          ],
        ));
  }
}


