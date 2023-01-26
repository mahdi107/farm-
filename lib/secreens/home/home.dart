import 'package:flutter/material.dart';
import 'package:myapp/secreens/Drawer_screen.dart';
import 'package:myapp/secreens/home/row_one.dart';
import 'package:myapp/secreens/home/row_two.dart';

import '../../Chat/chat.dart';

class Home_Secreen extends StatefulWidget {
  const Home_Secreen({super.key});

  @override
  State<Home_Secreen> createState() => _Home_SecreenState();
}

class _Home_SecreenState extends State<Home_Secreen> {
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 156, 182, 255)),
      backgroundColor: Colors.white,
      // appBar: const CatAppBar(),
      drawer: const Drawer_screen(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: width,
              height: height,
              child: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    width: width,
                    height: height,
                    child: const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            Color.fromARGB(255, 156, 182, 255),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: width / 10,
                      top: height / 45,
                      height: 2 * height / 45,
                      width: width - (width / 5),
                      child: const Text(
                        'Choose the service you want . . .',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Comfortaa-VariableFont_wght',
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Positioned(
                    height: height / 6,
                    left: width * 0.026 + width / 10,
                    top: 4 * height / 46,
                    width: width - (width / 4),
                    child: const Align(
                        alignment: Alignment.center, child: row_one()),
                  ),
                  Positioned(
                    height: height / 6,
                    left: width * 0.025 + width / 10,
                    top: 6 * height / 45 + height / 7,
                    width: width - (width / 4),
                    child: const Align(
                        alignment: Alignment.center, child: row_two()),
                  ),
                  Positioned(
                    left: width / 10,
                    height: height / 7,
                    width: width - (width / 5),
                    top: 2 * (height / 7) + (8 * height / 45),
                    child: Card(
                      shadowColor: Colors.blue[900],
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: GestureDetector(
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(255, 129, 162, 255),
                                Color.fromARGB(255, 129, 162, 255),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                ' ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                ' ',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Positioned(
                  //     left: width / 10,
                  //     top: 3 * (height / 7) + (10 * height / 45),
                  //     height: 2 * height / 45,
                  //     width: width - (width / 5),
                  //     child: const Text(
                  //       'Should you get a pet ?',
                  //       style: TextStyle(
                  //         fontSize: 20,
                  //         fontFamily: 'Comfortaa-VariableFont_wght',
                  //         letterSpacing: 1,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     )),
                  // Positioned(
                  //     left: width * 0.025 + width / 10,
                  //     top: 3 * (height / 7) +
                  //         (9 * height / 45) +
                  //         (3 * height / 45),
                  //     height: 2 * height / 45,
                  //     width: width - (width / 5),
                  //     child: Row(
                  //       children: [
                  //         const Text(
                  //           "Let's start the",
                  //           style: TextStyle(
                  //             fontSize: 16,
                  //             fontFamily: 'Comfortaa-VariableFont_wght',
                  //             letterSpacing: 1,
                  //           ),
                  //         ),
                  //         // TextButton(
                  //         //   child: const Text(
                  //         //     'QUIZ !',
                  //         //     style: TextStyle(
                  //         //       fontSize: 16,
                  //         //       fontFamily: 'Comfortaa-VariableFont_wght',
                  //         //       letterSpacing: 1,
                  //         //       color: Color.fromRGBO(13, 71, 161, 1),
                  //         //     ),
                  //         //   ),
                  //         //   onPressed: () {
                  //         //     Navigator.push(context, MaterialPageRoute(
                  //         //       builder: (context) {
                  //         //         return const WritingView();
                  //         //       },
                  //         //     ));
                  //         //   },
                  //         // ),
                  //       ],
                  //     )),
                  Positioned(
                      left: width / 10,
                      height: height / 7,
                      width: width - (width / 5),
                      top: 2 * (height / 7) + (8 * height / 45),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return ChatScreen();
                          }));
                        },
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/chat.png'))),
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
