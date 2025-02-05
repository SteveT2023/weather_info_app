import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
// This is final.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final TextEditingController _controller = TextEditingController();
  final Random _random = Random();

  String _city = '';
  String _temperature = '';
  String _weatherCondition = '';

  void _fetchWeather() {
    setState(() {
      _city = _controller.text;
      _temperature = '${_random.nextInt(16) + 15}°C';
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][_random.nextInt(3)];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // TextField for user to enter city name
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            // Button to fetch weather data
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
            // Display simulated weather information
            Text(
              'City: $_city',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Temperature: $_temperature',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Condition: $_weatherCondition',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
