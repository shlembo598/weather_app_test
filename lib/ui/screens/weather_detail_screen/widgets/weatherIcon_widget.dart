import 'package:flutter/material.dart';

class WeatherIconWidget extends StatelessWidget {
  const WeatherIconWidget({
    Key? key,
    required this.icon,
  }) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      icon,
      height: 123,
      width: 123,
    );
  }
}
