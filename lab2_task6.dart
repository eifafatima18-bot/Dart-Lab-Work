Future<String> fetchWeather(String city) async {
  await Future.delayed(Duration(seconds: 2));

  return '$city: 30°C, Sunny';
}

void main() async {
  print('Fetching weather...');

  String weather = await fetchWeather('Islamabad');

  print(weather);
}
