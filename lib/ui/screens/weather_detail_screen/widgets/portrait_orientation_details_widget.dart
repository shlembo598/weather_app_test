import 'package:flutter/material.dart';

import 'weather_detail_screen_widgets.dart';

class PortraitOrientationDetailsWidget extends StatelessWidget {
  final String? townName;
  final String? temperature;
  final String? icon;
  const PortraitOrientationDetailsWidget({
    Key? key,
    required this.townName,
    required this.temperature,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeatherIconWidget(icon: icon!),
        TownNameWidget(townName: townName!),
        TemperatureWidget(temperature: temperature!),
      ],
    );
  }
}
