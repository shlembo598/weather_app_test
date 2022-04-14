import 'package:flutter/material.dart';

import 'weather_detail_screen_widgets.dart';

class HorizontalOrientationDetailsWidget extends StatelessWidget {
  final String? townName;
  final String? temperature;
  final String? icon;
  const HorizontalOrientationDetailsWidget({
    Key? key,
    required this.townName,
    required this.temperature,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        WeatherIconWidget(icon: icon!),
        const SizedBox(
          width: 20,
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TownNameWidget(townName: townName!),
            TemperatureWidget(temperature: temperature!),
          ],
        ),
      ],
    );
  }
}
