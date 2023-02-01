import 'package:flutter/material.dart';
import 'package:myapp/secreens/home/advice.dart';
import 'package:myapp/secreens/wetharsecreen.dart';
import '../../Shop/HomePage.dart';
import '../../logic/containermidle.dart';

class row_one extends StatefulWidget {
  const row_one({super.key});

  @override
  State<row_one> createState() => _row_oneState();
}

class _row_oneState extends State<row_one> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child:
                Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              SizedBox(width: 0),
              Containermidle(
                name: 'Advices ',
                OnTapping: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Advice();
                  }));
                },
              ),
              SizedBox(width: 20),
              Containermidle(
                name: 'Shop',
                OnTapping: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeScreen();
                  }));
                },
              ),
              SizedBox(width: 20),
            ]),
          ),
        ),
      ),
    );
  }
}
