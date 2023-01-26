import 'package:flutter/material.dart';
import 'package:myapp/modul/wethar.dart';

import '../logic/wethar.dart';
import 'Drawer_screen.dart';

class wethar_secreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _wethar_secreenState();
}

class _wethar_secreenState extends State<wethar_secreen> {
  final _cityTextController = TextEditingController();
  final _dataService = DataService();

  WeatherResponse? _response;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromARGB(255, 120, 183, 234),
      appBar: AppBar(backgroundColor: Color.fromARGB(255, 156, 182, 255)),
      drawer: const Drawer_screen(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_response != null)
              Column(
                children: [
                  Image.network(_response!.iconUrl),
                  Text(
                    '${_response!.tempInfo.temperature}°',
                    style: TextStyle(fontSize: 40),
                  ),
                  Text(_response!.weatherInfo.description)
                ],
              ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                controller: _cityTextController,
                decoration: const InputDecoration(
                  suffixIcon: Padding(
                    padding: EdgeInsets.all(0.0),
                    child: Icon(
                      Icons.location_city,
                      color: Colors.grey,
                    ), // icon is 48px widget.
                  ),
                  border: OutlineInputBorder(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(30))),
                  labelText: 'city',
                  labelStyle: TextStyle(fontSize: 20),
                ),
              ),
              height: 55,
              width: 350,
            ),
            SizedBox(
              height: 5,
            ),
            ElevatedButton.icon(
                onPressed: _search,
                icon: Icon(Icons.search),
                label: Text("search"))
          ],
        ),
      ),
    ));
  }

  void _search() async {
    final response = await _dataService.getWeather(_cityTextController.text);
    setState(() => _response = response);
  }
}
