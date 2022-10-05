import 'package:flutter/material.dart';
import 'location_screen.dart';
import 'package:current_weather/main.dart';
import '../service/location.dart';

class LocationScreen extends StatefulWidget {
  dynamic getdata;
  LocationScreen({Key? key, this.getdata}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late String city;
  late double temp;
  late int status;
  late String showda;
  @override
  void initState() {
    super.initState();
    showData(widget.getdata);
  }

  void showData(data) {
    setState(() {
      temp = data['main']['temp'];
      city = data['name'];
      status = data['weather'][0]['id'];
      Notificaiton notificaiton = Notificaiton();
      showda = notificaiton.getNotification(status)!;
      print("status");
      print(temp);
      print(city);
    });
  }

  Notificaiton showvalue = Notificaiton();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Current Location ")),
      body: Column(
        children: [
          Text("Temparature"),
          Text(temp.round().toString()),
          Text("city"),
          Text(city),
          Text("comments"),
          Text(showda)
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Location loc = Location();
          var loca = await loc.getLocation();
          showData(loca);
        },
        child: Icon(Icons.navigation),
      ),
    );
  }
}
