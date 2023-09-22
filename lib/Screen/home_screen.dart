import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../module/User.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key,this.user});
  User? user;


  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: DrawerHeader(child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: FileImage(File(widget.user!.profileImage!)),
            ),

          ListTile(
            title: Text(widget.user!.name!),
            subtitle: Text(widget.user!.email!),
          )
          ],
        )),
      ),
      appBar: AppBar(
        backgroundColor:Colors.lime[200],
      ),
    );
  }
}
