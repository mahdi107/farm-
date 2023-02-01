import 'package:flutter/material.dart';
import 'package:myapp/widgets/state.dart';
import '../Drawer_screen.dart';

class stat extends StatefulWidget {
  const stat({super.key});

  @override
  State<stat> createState() => _statState();
}

class _statState extends State<stat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 156, 182, 255)),
      backgroundColor: Colors.white,
      drawer: const Drawer_screen(),
      body: ListView(children: [
        SizedBox(
          height: 30,
        ),
        StateCard(image: ("images/static1.jpeg")),
        SizedBox(
          height: 20,
        ),
        StateCard(image: ("images/static2.jpeg")),
        SizedBox(
          height: 20,
        ),
        StateCard(image: ("images/static3.jpeg")),
        SizedBox(
          height: 20,
        ),
        StateCard(image: ("images/static4.jpeg")),
        SizedBox(
          height: 20,
        ),
        StateCard(image: ("images/static5.jpeg")),
        SizedBox(
          height: 20,
        ),
        StateCard(image: ("images/static6.jpeg")),
        SizedBox(
          height: 20,
        ),
      ]),
    );
  }
}
