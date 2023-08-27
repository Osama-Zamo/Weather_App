import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/no_location.dart';
import 'package:weather_app/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    bool locationEnabeld = await Geolocator.isLocationServiceEnabled();

    if (locationEnabeld) {
      var weatherData = await WeatherModel().getLocationWeather();

      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return LocationScreen(
          locationWeather: weatherData,
        );
      }));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return NoLocation();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Weather',
            style: TextStyle(fontSize: 50),
          ),
          SizedBox(
            height: 10,
          ),
          SpinKitPouringHourGlass(
            color: Colors.amber,
            size: 100.0,
          ),
        ],
      ),
    );
  }
}
