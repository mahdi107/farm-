import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'home/home.dart';
import 'login.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  bool _isObscure3 = true;
  bool visible = false;
  bool email = false;
  Future<void> addUser() async {
    var auth = FirebaseAuth.instance;
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text, password: passwordController.text);
    // Call the user's CollectionReference to add a new user
    return user
        .doc(userCredential.user?.uid)
        .set({
          'username': nameController.text, // John Doe
          'email': emailController.text, // John Doe
          'password': passwordController.text, // Stokes and Sons
          'isAdmin': false,
        })
        .then((value) => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const Home_Secreen())))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Widget _entryField(String title, controller, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: controller,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25)),
                ),
                labelText: title,
                labelStyle: TextStyle(fontSize: 20),
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.white,
          shadowColor: Colors.transparent,
        ),
        onPressed: () {
          addUser();
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [Color(0xff2b5eaf), Color(0xff2b5eaf)])),
          child: Text(
            'Register Now',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ),
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login_screen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        padding: EdgeInsets.all(0),
        alignment: Alignment.bottomCenter,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(
                fontFamily: 'Tajawal-Light',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                fontFamily: 'Tajawal-Light',
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xff2b5eaf),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Padding(
      padding: const EdgeInsets.only(left: 40, right: 40),
      child: Column(
        children: <Widget>[
          _entryField("Username", nameController),
          _entryField("Email id", emailController),
          _entryField("Password", passwordController, isPassword: true),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: Text("abed"),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 150),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 2, left: 2),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 10, left: 10),
                      child: _emailPasswordWidget(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.only(
                                top: 10, bottom: 5, right: 15, left: 15),
                            backgroundColor: Color(0xffd7e5ff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: const Text(
                            'Register Now',
                            style: TextStyle(
                                color: Color(0xff5674cc),
                                fontSize: 25,
                                fontFamily: "Tajawal-Light",
                                letterSpacing: 1,
                                fontWeight: FontWeight.w600),
                          ),
                          onPressed: () {
                            addUser();
                          },
                        )),
                    SizedBox(height: 25),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, right: 20, left: 20),
                      child: _loginAccountLabel(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
