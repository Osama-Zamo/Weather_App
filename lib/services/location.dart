import 'package:geolocator/geolocator.dart';

class Location {
  double altitude = 0;
  double longitude = 0;

  Future<void> getCurrentLocation()  async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    } else {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      altitude = position.altitude;
      longitude = position.longitude;
    }
  }
}
