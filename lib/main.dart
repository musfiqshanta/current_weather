import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'screen/city_screen.dart';
import 'service/networking.dart';
import 'service/location.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late double long;
  late double lati;

  @override
  void initState() {
    getlocation();
  }

  void getlocation() async {
    Location getl = Location();

  

    var getdata = await getl.getLocation();

    if (!mounted) return;

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => LocationScreen(
                  getdata: getdata,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: SpinKitChasingDots(color: Colors.amber),
        ));
  }
}
