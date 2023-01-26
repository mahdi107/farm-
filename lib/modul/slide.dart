import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    required this.imageUrl,
    required this.title,
    required this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'images/2.jpg',
    title: 'A Cool Way to Get Start ',
    description:
        "All what you need to know or to have for your farm in one application .",
  ),
  Slide(
    imageUrl: 'images/3.jpg',
    title: 'What our application can do !',
    description:
        " read, shop, and look for soulotions about agriculture .",
  ),
  Slide(
    imageUrl: 'images/1.jpg',
    title: "It's Just the Beginning",
    description: 'We will keep improving our application.',
  ),
];
