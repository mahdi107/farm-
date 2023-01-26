import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Containermidle extends StatelessWidget {
  Containermidle({this.imagepath, required this.OnTapping, required this.name});
  String? imagepath;
  String? name;

  Function() OnTapping;
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return GestureDetector(
      onTap: OnTapping,
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: width / 5,
              height: height / 6,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 0,
                    blurRadius: 2,
                  )
                ],
                borderRadius: const BorderRadius.all(Radius.circular(25)),
              ),
              child: Column(
                children: [
                  // Center(
                  //   child: Padding(
                  //     padding: const EdgeInsets.only(bottom: 0),
                  //     child: SvgPicture.asset(
                  //       "$imagepath",
                  //       width: width / 18,
                  //       height: height / 16,
                  //       alignment: Alignment.center,
                  //       fit: BoxFit.contain,
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 7,
                  ),
                  Center(
                    child: Container(
                      alignment: Alignment.center,
                      width: width,
                      child: Text(
                        '${name}',
                        style: TextStyle(
                          fontSize: 10,
                          fontFamily: 'Comfortaa-VariableFont_wght',
                          letterSpacing: 1,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
