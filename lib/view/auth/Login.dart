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

  /*Login() async {
    var formData = fromstate.currentState;

    if (formData!.validate()) {
      var data = await authcontroller.LoginAuth(email.text, pwd.text);
      if (data["message"] == "User doesn't exists!" &&
          data["message"] == "email or password is not correct") {
        print("User doesn't exists! or  email or password is not correct");
      } else {
        print(data);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(userID: data['userID'])));
      }
    } else {
      print('Form is invalid');
    }
  }*/
  Future<void> performLogin() async {
    var formData = fromstate.currentState;

    if (formData!.validate()) {
        var data = await authcontroller.LoginAuth(email.text, pwd.text);
        if (data != null && (data["message"] == "User doesn't exists!" ||
            data["message"] == "email or password is not correct")) {
            print("User doesn't exists! or email or password is not correct");
        } else if (data != null) {
            print(data);
            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(MicanicienID: data['MicanicienID'])));
        }
    } else {
        print('Form is invalid');
    }
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
              Text('Mabo auto help  Micaniciens',
                  style: TextStyle(
                      fontSize: 30, color: Color.fromARGB(255, 244, 59, 3))),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(fontSize: 30, color: Colors.lightBlue),
                    ),
                  ],
                ),
              ),

              ///------------------Email---------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: email,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'email is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "email",
                    prefixIcon: Icon(Icons.email),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),

              ///-------------------Pwd--------------------
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: pwd,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Password is required';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "password",
                    prefixIcon: Icon(Icons.password),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),

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
