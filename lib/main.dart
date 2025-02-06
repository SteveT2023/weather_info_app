import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
  List<Map<String, String>> _weeklyForecast = [];

  void _fetchWeather() {
    setState(() {
      _city = _controller.text;
      _temperature = '${_random.nextInt(16) + 15}°C';
      _weatherCondition = ['Sunny', 'Cloudy', 'Rainy'][_random.nextInt(3)];
    });
  }

  void _fetchWeeklyForecast() {
    setState(() {
      _weeklyForecast = List.generate(7, (index) {
        return {
          'day': 'Day ${index + 1}',
          'temperature': '${_random.nextInt(16) + 15}°C',
          'condition': ['Sunny', 'Cloudy', 'Rainy'][_random.nextInt(3)],
        };
      });
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
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Enter City',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _fetchWeeklyForecast,
              child: const Text('Get 7-Day Forecast'),
            ),
            const SizedBox(height: 20),
            if (_weeklyForecast.isNotEmpty)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: _weeklyForecast.map((day) {
                  return Card(
                    child: ListTile(
                      title: Text(day['day']!),
                      subtitle: Text('${day['temperature']} - ${day['condition']}'),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
