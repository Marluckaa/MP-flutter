import 'package:anu/controllers/auth_controller.dart';
import 'package:anu/screens/sign_up.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatelessWidget {
late String email = "";
late String password = "";
late String _response = "";
final GlobalKey<FormState> _formKey =  GlobalKey<FormState>();
final AuthController _authController =  AuthController();
loginUser() async {
  String response = await _authController.loginUser(email, password);

  if(response == 'Login Success'){
    //logged in
    print("success");
  }else{
    print(_response);
    //error
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Log In",
                style: TextStyle(
                  color: const Color.fromARGB(255, 105, 121, 226),
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.2,
                  fontSize: 23,
                ),
              ),
              const Text(
                "Welcome back!",
                style: TextStyle(
                  color: const Color.fromARGB(255, 105, 121, 226),
                  fontFamily: "Lato",
                  letterSpacing: 0.2,
                  fontSize: 18,
                ),
              ),
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
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 105, 121, 226),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "Enter your email address",
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
                validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Please enter your email address";
                    } else if(value.length < 8){
                      return 'Password must be at least 8 characters';
                    }
                    return null;
                  },
                obscureText: true, // Hide password
                decoration: InputDecoration(
                  fillColor: const Color.fromARGB(255, 105, 121, 226),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  labelText: "Enter your password",
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
                height: 40,
              ),
              InkWell(
                onTap: () {
                  // Handle login logic here
                },
                child: InkWell(
                 // onTap: loginUser(),
                 onTap: (){
                  if(_formKey.currentState!.validate()){
                    loginUser();
                    if(_response == "Login Success"){
                      Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Scaffold()));
                    }
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
                        "Log In",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigate to the sign-up screen
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => signUpScreen()),
                      );
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color.fromARGB(255, 121, 64, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
