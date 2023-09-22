import 'package:day2192023/Screen/home_screen.dart';
import 'package:day2192023/Screen/signup_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lime[100],
        child: ListView(
          children: [
            Image.asset("assets/img.png",width: 250,height: 250,),

            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: "Email",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                      )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                          return HomeScreen();
                        }));
                      },
                      child: Text("Sign In"),
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20,horizontal: 100)),
                      textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                  ),

                  TextButton(onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context){
                      return SignUpScreen();
                    }));
                  }, child: Text("Sign Up"))
                ],
              )),
            )
          ],
        ),
      ),
    );
  }
}
