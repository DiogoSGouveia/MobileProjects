import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:lottie/lottie.dart';

import 'package:weather_app/model/weather_model.dart';
import 'package:weather_app/service/weather_service.dart';

String apiKey = dotenv.env['WEATHER_API_KEY']!;

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  // api key
  final _weatherService = WeatherService(apiKey: apiKey);
  Weather? _weather;

  // fetch the weather data
  _fetchWeather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();

    // get the weather data
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  // weather animation
  String getWeatherAnimation(String? mainCondition) {
    switch (mainCondition) {
      case 'Clouds':
        return 'assets/cloudy.json';
      case 'Mist':
        return 'assets/cloudy.json';
      case 'Smoke':
        return 'assets/cloudy.json';
      case 'Haze':
        return 'assets/cloudy.json';
      case 'Dust':
        return 'assets/cloudy.json';
      case 'Fog':
        return 'assets/cloudy.json';
      case 'Rain':
        return 'assets/rainy.json';
      case 'Drizzle':
        return 'assets/rainy.json';
      case 'Shower rain':
        return 'assets/rainy.json';
      case 'Thunderstorm':
        return 'assets/storm.json';
      case 'Clear':
        return 'assets/sunny.json';
      default:
        return 'assets/sunny.json';
    }
  }

  // init the state
  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // icon location
            Icon(
              Icons.location_on,
              color: Colors.grey[500],
              size: 20,
            ),

            const SizedBox(height: 10),

            // city name
            Text(
              _weather?.cityName ?? 'Unknown',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 20,
                //fontWeight: FontWeight.bold,
              ),
            ),
            // space
            const SizedBox(height: 100),

            // animation
            Lottie.asset(getWeatherAnimation(_weather?.mainCondition)),

            const SizedBox(height: 100),
            // temperature
            Text(
              '${_weather?.temperature.round() ?? 0}°',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),

            // weather condition
            Text(
              _weather?.mainCondition ?? 'Unknown',
              style: TextStyle(
                color: Colors.grey[500],
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
