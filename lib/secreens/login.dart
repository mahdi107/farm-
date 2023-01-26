import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/secreens/signup.dart';

import 'gmail.dart';
import 'home/TopHome.dart';
import 'home/home.dart';

class Login_screen extends StatefulWidget {
  const Login_screen({Key? key}) : super(key: key);

  @override
  State<Login_screen> createState() => _Login_screenState();
}

class _Login_screenState extends State<Login_screen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  Future<void> addUser() async {
    var login = FirebaseAuth.instance;
    UserCredential userCredential =
        await login.signInWithPopup(GoogleAuthProvider());
    // check if user document is exist
    var userDoc = await user.doc(userCredential.user!.uid).get();
    if (!userDoc.exists) {
      // if not exist create new user document
      await user.doc(userCredential.user!.uid).set({
        'email': userCredential.user!.email,
        'isAdmin': false,
      });
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Home()),
    );
  }

  Future<void> Login() async {
    try {
      var login = FirebaseAuth.instance;
      UserCredential userCredential = await login.signInWithEmailAndPassword(
          email: nameController.text, password: passwordController.text);
      // ignore: use_build_context_synchronously
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const Home_Secreen()));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("sorry something wrong"),
      ));
    }
  }

  bool _isObscure3 = true;
  bool visible = true;
  bool email = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // alignment: Alignment.topRight,
              padding: const EdgeInsets.only(top: 0),
              child: Image.asset(
                "images/5.jfif",
              ),
            ),
            Container(
              child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: TextFormField(
                          controller: nameController,
                          decoration: const InputDecoration(
                            suffixIcon: Padding(
                              padding: EdgeInsets.all(0.0),
                              child: Icon(
                                Icons.email,
                                color: Colors.grey,
                              ), // icon is 48px widget.
                            ),
                            border: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(25))),
                            labelText: 'Email',
                            labelStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                        height: 55,
                      ),
                      const SizedBox(height: 15),
                      Container(
                        height: 55,
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: _isObscure3,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  icon: Icon(_isObscure3
                                      ? Icons.visibility_off
                                     :  Icons.visibility
                                     ),
                                  onPressed: () {
                                    setState(() {
                                      _isObscure3 = !_isObscure3;
                                    });
                                  }),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Password',
                              enabled: true,
                              border: OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)))),
                        ),
                      ),
                      SizedBox(height: 20),
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
                              '        Log  in        ',
                              style: TextStyle(
                                  color: Color(0xff5674cc),
                                  fontSize: 25,
                                  fontFamily: "Tajawal-Light",
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.w600),
                            ),
                            onPressed: () {
                              Login();
                            },
                          )),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          padding: EdgeInsets.only(left: 50, right: 50),
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                const Text(
                                  'Does not have account?',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Tajawal-Light',
                                    fontSize: 20,
                                  ),
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Padding(
                                        padding: EdgeInsets.only(left: 190),
                                        child: TextButton(
                                          child: const Text(
                                            'Sign up',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color(0xff2b5eaf),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.push(context,
                                                MaterialPageRoute(
                                              builder: (context) {
                                                return SignUpPage();
                                              },
                                            ));
                                          },
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                  ],
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.center,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            const Text(
                              'you can Login with ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                            TextButton(
                              child: const Text(
                                'Gmail',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Color(0xff2b5eaf),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(
                                  builder: (context) {
                                    return LoginWithGmail();
                                  },
                                ));
                              },
                            )
                          ],
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
