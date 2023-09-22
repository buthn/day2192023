import 'dart:convert';
import 'dart:io';
import 'package:day2192023/Screen/home_screen.dart';
import 'package:day2192023/module/User.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignUpScreen> {

  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();



  // GlobalKey<FormState> formKey = GlobalKey<FormState>();
  // addData()async{
    // var formData = formKey.currentState;
  //   if(formData!.validate())
  //     {
  //       print("valid");
  //     }
  //   else{
  //     print("Invalid");
  //   }
  //   formData.save();
  // }
  // var userName,userEmail;
  // List<User> userList = [
  //   User(name: userName,email: userEmail,phone: "9555555",gender: "Female",),
  // ];
  File? image;
  ImagePicker imagePicker = ImagePicker();
  uploadImage()async{
      var chooseImage = await imagePicker.pickImage(source: ImageSource.camera);
      if(chooseImage != null)
        {
          setState(() {
            image  = File(chooseImage.path);
          });
        }
  }
   String radioGroub = "Gender";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.lime[100],
        child: ListView(
          children: [
             image != null ? CircleAvatar(
              radius:60,
              backgroundImage:FileImage(image!)
            ):InkWell(
               onTap: () async{
                 await uploadImage();
               },
              child: CircleAvatar(
                   child: Icon(Icons.add),
                   radius:60,
                   backgroundColor: Colors.black26,
               ),
            ),

            Container(
              margin: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: nameController,
                    // onSaved: (name){
                    //   userName = name;
                    // },
                    decoration: InputDecoration(
                        hintText: "Name",
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    controller: emailController,
                    // onSaved: (email){
                    //   userEmail = email;
                    // },
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
                        hintText: "Phone",
                        prefixIcon: Icon(Icons.phone),
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
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Radio(
                              value: "Male", groupValue: radioGroub, onChanged: (v){
                            setState(() {
                              radioGroub =v!;
                            });
                          }),
                          Text("Male"),
                        ],
                      ),
                      Row(
                        children: [
                          Radio(value: "Female", groupValue: radioGroub, onChanged: (v){
                            setState(() {
                              radioGroub =v!;
                            });
                          }),
                          Text("Female"),
                        ],
                      ),


                    ],
                  ),

                  SizedBox(height: 20,),

                  ElevatedButton(
                    onPressed: ()async{
                      SharedPreferences pref = await SharedPreferences.getInstance();

                      User u = User(
                        profileImage: image!.path,
                        name: nameController.text,
                        email: emailController.text,
                      );

                      var data = jsonEncode(u.toMap());
                      pref.setString(u.email!, data);

                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return HomeScreen(user: u,);
                      }));
                    },
                    child: Text("Sign Up"),
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      padding: MaterialStatePropertyAll(EdgeInsets.symmetric(vertical: 20,horizontal: 100)),
                      textStyle: MaterialStatePropertyAll(TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
