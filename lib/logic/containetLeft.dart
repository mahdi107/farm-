import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class containerN extends StatelessWidget {
  containerN({this.imagepath, required this.OnTapping});
  String? imagepath;

  Function() OnTapping;
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return GestureDetector(
      onTap: OnTapping,
      child: Column(children: [
        Container(
          width: width / 3.5,
          height: height / 3.7,
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                spreadRadius: 0,
                blurRadius: 2,
              )
            ],
            borderRadius: const BorderRadius.all(Radius.circular(24)),
          ),
          child: Center(
            child: Container(
              alignment: Alignment.center,
              width: width / 4,
              height: height / 5,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Image.asset(
                    "$imagepath",
                    width: width / 4,
                    height: height / 5,
                    alignment: Alignment.center,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
