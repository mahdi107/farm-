import 'package:flutter/material.dart';


import '../modul/slide.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: double.infinity,
          height: 275,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                slideList[index].imageUrl,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 40,
        ),
        Text(
          slideList[index].title,
          style: TextStyle(
            fontFamily: 'Comfortaa-VariableFont_wght',
            fontSize: 24,
            color: Colors.blue[900],
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            slideList[index].description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: 'Comfortaa-VariableFont_wght',
              fontSize: 20,
            ),
          ),
        ),
      ],
    );
  }
}
