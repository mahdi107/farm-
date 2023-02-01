
import 'package:flutter/material.dart';
import 'package:myapp/Shop/constans.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({
    Key? key,
    required this.size,
    required this.image,
    required this.Tag,
  }) : super(key: key);

  final Size size;
  final String image;
  final String Tag;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: kDefaultPadding,
      ),
      height: size.width * 0.8,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: size.width * 0.7,
            width: size.width * 0.7,
         
          ),
          Hero(
              tag: "$Tag",
              child: Container(
                decoration: const BoxDecoration(
                  color: kBackgroundColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75),
                    topRight: Radius.circular(75),
                    bottomLeft: Radius.circular(75),
                    bottomRight: Radius.circular(75),
                  ),
                ),
                child: Image.network(
                  image,
                  height: size.width * 0.75,
                  width: size.width * 0.75,
                  fit: BoxFit.cover,
                ),
              ))
              
        ],
      ),
    );
  }
}
