
import 'package:flutter/material.dart';

import '../../logic/containermidle.dart';

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
              // Containermidle(
              //     name: 'Bird',
              //     OnTapping: () {
              //       // Navigator.push(context,
              //       //     MaterialPageRoute(builder: (context) {
              //       //   return BirdScreen();
              //       }
              //       // ));
                  
              //    ),
              SizedBox(width: 20),
              // Containermidle(
              //     name: 'Horse',
              //     OnTapping: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) {
                    //   return HorseScreen();
                    // }));
                //   },
                //  ),
              // SizedBox(width: 20),
              // Containermidle(
              //     name: 'Rabbit',
              //     OnTapping: () {
              //       // Navigator.push(context,
              //       //     MaterialPageRoute(builder: (context) {
              //       //   return RabbitScreen();
              //       // }));
              //     },
              //    ),
            ]),
          ),
        ),
      ),
    );
  }
}
