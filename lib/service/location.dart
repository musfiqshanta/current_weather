import 'package:geolocator/geolocator.dart';
import 'networking.dart';

class Location {
  late double latitu;
  late double longit;

  Future<dynamic> getLocation() async {
    bool serviceEnabled;
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    LocationPermission permission;
     serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
    return Future.error('Location services are disabled.');
  }
    latitu = position.latitude;
    longit = position.longitude;

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=ff6fae2834b3c9d874a5c481ba203d15&units=metric');

    var datafrom = await networkHelper.getdata();
    permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }
  
  if (permission == LocationPermission.deniedForever) {
    return Future.error(
      'Location permissions are permanently denied, we cannot request permissions.');
  }
    return datafrom;
  }
}
