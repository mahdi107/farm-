import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:myapp/secreens/home/home.dart';
import 'package:myapp/secreens/login.dart';

class Drawer_screen extends StatefulWidget {
  const Drawer_screen({super.key});

  @override
  State<Drawer_screen> createState() => _Drawer_screenState();
}

class _Drawer_screenState extends State<Drawer_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Colors.white,
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(250),
                ),
              ),
            ),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 70,
              backgroundImage: AssetImage("images/user.png"),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Padding(padding: EdgeInsets.only(right: 110)),
                const Icon(
                  Icons.circle_rounded,
                  size: 12,
                  color: Color.fromARGB(255, 78, 241, 84),
                ),
                const Text(
                  "",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 25,
            ),
            Expanded(
              child: ListView(children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: ((context) {
                          return const Home_Secreen();
                        })));
                      });
                    },
                    leading: const Icon(
                      Icons.home,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Home",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ListTile(
                    onTap: () {
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: ((context) {
                          return const Login_screen();
                        })));
                      });
                    },
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Log in",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ListTile(
                    onTap: () {
                      FirebaseAuth.instance.signOut();
                      setState(() {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: ((context) {
                          return const Login_screen();
                        })));
                      });
                    },
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.black,
                    ),
                    title: const Text(
                      "Log out",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.8),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: ListTile(
                      onTap: () {
                        exit(0);
                      },
                      leading: const Icon(
                        Icons.exit_to_app,
                        color: Colors.black,
                      ),
                      title: const Text(
                        "Exit app",
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.8),
                      )),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
