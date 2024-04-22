import 'package:anu/controllers/auth_controller.dart';
import 'package:anu/screens/log_in.dart';
import 'package:flutter/material.dart';

class signUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final AuthController _authController = AuthController();
  late String email;
  late String password;

  //get fontFamily => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
        key: _formKey,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Create new account",
                  style: TextStyle(
                      color: Color.fromARGB(255, 105, 121, 226),
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.2,
                      fontSize: 23),
                ),
                const Text("Welcome to our App",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 105, 121, 226),
                      fontFamily: "Lato",
                      letterSpacing: 0.2,
                      fontSize: 18,
                    )),
                Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTOTtV8dPbbBc47kn7Q9K3w5ylioYJ1G2BrQ&usqp=CAU",
                  height: 150,
                  width: 150,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Email",
                    style: TextStyle(
                      fontFamily: "Nunito Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    email = value;
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter your email ";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 105, 121, 226),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: "enter your email address",
                    labelStyle: TextStyle(
                      fontFamily: "Nunito Sans",
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Password",
                    style: TextStyle(
                      fontFamily: "Nunito Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  onChanged: (value) {
                    password = value;
                  }, 
          
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please enter a password";
                    } else if (value.length < 8) {
                      return "Your password must be at least 8 characters";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    fillColor: const Color.fromARGB(255, 105, 121, 226),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: "create new password",
                    labelStyle: TextStyle(
                      fontFamily: "Nunito Sans",
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                    prefixIcon: Icon(
                      Icons.lock,
                      size: 20,
                    ),
                    suffixIcon: Icon(Icons.visibility),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: const Text(
                    "Verify",
                    style: TextStyle(
                      fontFamily: "Nunito Sans",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                TextFormField(
                  decoration: InputDecoration(
                    fillColor: Color.fromARGB(255, 113, 129, 234),
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    labelText: "verify your password",
                    labelStyle: TextStyle(
                      fontFamily: "Nunito Sans",
                      fontSize: 14,
                      letterSpacing: 0.1,
                    ),
                    prefixIcon: Icon(
                      Icons.email,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    //end button darahad hiigdeh uildel,huruu garch ireh
                    if(_formKey.currentState!.validate()){
                     _authController.registerNewUser(email, password);

                    }else{
                      print('failed');
                    }
                  },
                  child: Container(
                    width: 320,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 105, 121, 226),
                          Color.fromARGB(124, 82, 27, 95)
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have account? ",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                        )),
                    InkWell(
                      onTap: () {
                        //end button darahad hiigdeh uildel
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LogInScreen();
                        }));
                      },
                      child: Text("Log In",
                          style: TextStyle(
                              color: Color.fromARGB(255, 121, 64, 255),
                              fontWeight: FontWeight.bold)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
