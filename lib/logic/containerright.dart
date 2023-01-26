import 'package:flutter/material.dart';

class ContainerRight extends StatelessWidget {
  ContainerRight({this.imagepath, this.title, required this.OnTapping});
  String? imagepath;
  String? title;

  Function() OnTapping;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: OnTapping,
      child: Column(
        children: [
          Container(
            width: 125,
            height: 125,
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color.fromRGBO(255, 179, 0, 1),
                  spreadRadius: 1,
                  blurRadius: 1,
                )
              ],
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(1),
                  child: Flexible(
                    child: Text(
                      "${title}",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
