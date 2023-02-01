import 'package:flutter/material.dart';

class StateCard extends StatelessWidget {
  final String image;
  StateCard({
    required this.image,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 110, vertical: 10),
      width: MediaQuery.of(context).size.width,
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 20.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0),
            BlendMode.multiply,
          ),
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
