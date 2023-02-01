import 'package:flutter/material.dart';
import 'package:myapp/secreens/home/static.dart';
import '../../logic/containermidle.dart';
import '../wetharsecreen.dart';

class row_two extends StatefulWidget {
  const row_two({super.key});

  @override
  State<row_two> createState() => _row_twoState();
}

class _row_twoState extends State<row_two> {
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
                  name: 'Statistics',
                  OnTapping: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return stat();
                  }
                  ));
                  }
                  ),
              SizedBox(width: 20),
              Containermidle(
                name: 'Wethar',
                OnTapping: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return wethar_secreen();
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
