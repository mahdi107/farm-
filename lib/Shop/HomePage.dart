import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:myapp/Shop/CreateNewItem.dart';
import 'package:myapp/Shop/cart.dart';
import 'package:myapp/Shop/constans.dart';
import 'package:myapp/Shop/home_body.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  bool admin = false;
  bool isLoading = true;
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        FirebaseFirestore.instance
            .collection("users")
            .doc(user.uid)
            .get()
            .then((value) {
          if (value["isAdmin"] == true) {
            setState(() {
              isLoading = false;
              admin = true;
            });
          }
        });
        print('User is signed in!');
        print(admin);
      }
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      
       bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // if (admin)
            FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CreateNewFile()));
              },
              child: const Icon(Icons.add),
              backgroundColor: kPrimaryColor,
            ),
            SizedBox(width: 15,),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Cart()),
              );
            },
            child: const Icon(Icons.shopping_bag),
            backgroundColor: kPrimaryColor,
          ),
        ],
      ),
      backgroundColor: kPrimaryColor,
      appBar: homeAppbar(),
      body: HomeBody(
          // shop: '',

          ),
    );
  }

  AppBar homeAppbar() {
    return AppBar(
      backgroundColor: kPrimaryColor,
      elevation: 0,
      title: Text(
        "Welcome to farm store",
        style: TextStyle(
            fontFamily: 'Comfortaa-VariableFont_wght',
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
      centerTitle: false,
    );
    
  }
}
