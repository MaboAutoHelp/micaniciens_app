import 'package:flutter/material.dart';
import 'package:micaniciens_app/controller/Authcontroller.dart';
import 'package:micaniciens_app/view/Home.dart';

class Login extends StatefulWidget {
  const Login({Key? key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = TextEditingController();
  TextEditingController pwd = TextEditingController();

  GlobalKey<FormState> fromstate = GlobalKey<FormState>();

  Authcontroller authcontroller = Authcontroller();

  
  Future<void> performLogin() async {
   
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(MicanicienID: "66eeeb9b4298d00f86655d44")));
        }
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Form(
          key: fromstate,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              

              ///--------------------------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                     performLogin();
                  },

                  child: Text('Login'),
                ),
              ),
               
              
            ],
          ),
        ),
      ),
    ));
  }
}
