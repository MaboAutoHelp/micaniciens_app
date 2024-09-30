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

  
  Login() async {
    var formData = fromstate.currentState;

    if (formData!.validate()) {
      var data = await authcontroller.LoginAuth(email.text, pwd.text);
      if (data["message"] == "User doesn't exists!" ||
          data["message"] == "email or password is not correct") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('User doesn\'t exist or email/password is incorrect'),
            backgroundColor: Colors.red,
          ),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(MicanicienID: data['ZizaID'])),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form is invalid, please correct the fields'),
          backgroundColor: Colors.orange,
        ),
      );
    }
  }
   


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: fromstate,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Ziza',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF003366), // لون أزرق داكن
                    ),
                  ),
                  SizedBox(height: 20),

                  Row(
                    children: [
                      Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  ///------------------Email---------------------
                  TextFormField(
                    controller: email,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Username is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Username",
                      prefixIcon: Icon(Icons.email, color: Colors.lightBlue),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  ///-------------------Pwd--------------------
                  TextFormField(
                    controller: pwd,
                    obscureText: true,
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Password is required';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Password",
                      prefixIcon: Icon(Icons.lock, color: Colors.lightBlue),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.lightBlue),
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  ///-------------------Login Button--------------------
                 ElevatedButton(
  onPressed: () {
    Login();
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Color(0xFF003366), // اللون الأزرق الداكن
    padding: EdgeInsets.symmetric(
      horizontal: 50,
      vertical: 15,
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
  ),
  child: Text(
    'Login',
    style: TextStyle(
      fontSize: 18,
      color: Colors.white,
    ),
  ),
)
,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
