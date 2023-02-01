import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:myapp/secreens/Drawer_screen.dart';

class Advice extends StatefulWidget {
  const Advice({super.key});

  @override
  State<Advice> createState() => _AdviceState();
}

class _AdviceState extends State<Advice> with TickerProviderStateMixin {
  var Data;

  var storage = FlutterSecureStorage();
  @override
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    TabController tabController = TabController(length: 4, vsync: this);
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(backgroundColor: Color.fromARGB(255, 156, 182, 255)),
          backgroundColor: Colors.white,
          
          drawer: Drawer_screen(),
          body:  ListView(children: [
            Container(
                width: width,
                height: height,
                child: Stack(fit: StackFit.loose, children: [
                  Container(
                    width: width,
                    height: height,
                    child: DecoratedBox(
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
                      top: 7 * height / 45,
                      height: 10 * height / 45,
                      width: width - (width / 5),
                      child: DecoratedBox(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/tips.jfif'),
                                  fit: BoxFit.contain)))),
                  Positioned(
                      left: width / 8,
                      top: 8 * height / 45 + 10 * height / 45,
                      height: 2.5 * height / 2,
                      width: width - (width / 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          child: Text(
                            'QUICK AND USEFUL TIPS FOR SUCCESSFUL FARMING :',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Comfortaa-VariableFont_wght',
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                      left: width / 10,
                      top: 9 * height / 45 +
                          10 * height / 45 +
                          2.5 * height / 45,
                      width: width - (width / 5),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '1.DO NOT BURN BUSH WHEN CLEARING YOUR FARM. ',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(height: height / 55),
                              Text(
                                "Burning bush in the farm not only affects the soil, it also has adverse effects on climate change. It exposes the land to the effect of wind, water erosion and ultraviolet radiation.Instead of burning the bush, you can gather them and use them as mulch to protect the soil or manure to provide nutrients to the soil.",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                  letterSpacing: 0,
                                ),
                              ),
                              Container(height: height / 55),
                              Text(
                                '2.MAKE RIDGES WHEN PLANTING CROPS ON YOUR FARM INSTEAD OF FLAT LAND.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(height: height / 55),
                              Text(
                                'Ridging is the gathering of soil from the sides, channelling it towards the centre, so as to create a pile of raised soil with a trapezoidal contour.Ridges help to improve soil health, reduce erosion, runoff and make weeding easier for farmers. Thereby ensuring you have optimal produce during harvest.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                  letterSpacing: 0,
                                ),
                              ),
                              Container(height: height / 55),
                              Text(
                                '3.PLANT COVER CROPS ON YOUR FARM TO ENRICH YOUR SOIL WITH NUTRIENTS.',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(height: height / 55),
                              Text(
                                "Planting cover crops before your intended planting season or before planting your main crops as a form of crop rotation will do your soil a lot of good.Cover crops help prevent soil erosion, regulate moisture, attract pollinators, assist in weed and pest management, serve as mulch and the source of green manure and organic matter. They help improve soil health.Beans, cowpeas, wheat, barley are examples of cover crops you can consider planting in your farm.",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                  letterSpacing: 0,
                                ),
                              ),
                              Container(height: height / 55),
                              Text(
                                '4. WHEN CULTIVATING A LARGE PIECE OF LAND, MAKE USE OF AGRICULTURAL TECHNOLOGY.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                  letterSpacing: 1,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Container(height: height / 55),
                              Text(
                                'Cultivating a large piece of land often means more profit than the average Nigerian farmer, however, if you are using traditional farm tools, it may result in more loss than profit and you may be unable to utilise the land properly. You will also need to employ more hands to work on the farm with you. However, using farm machinery like a tractor will enable you to get the job done faster for farming activities such as, ploughing, tilling, harrowing and planting. Using an herbicide instead of manually weeding with your hands.',
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 12,
                                  fontFamily: 'Comfortaa-VariableFont_wght',
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                ]))
          ])),
    );
  }
}
