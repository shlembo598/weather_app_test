import 'package:flutter/cupertino.dart';

import 'weather_detail_screen_widgets.dart';

class WeatherDetailWidget extends StatelessWidget {
  final String? townName;
  final String? temperature;
  final String? icon;

  const WeatherDetailWidget({
    Key? key,
    this.townName,
    this.temperature,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, orientation) {
      return orientation == Orientation.portrait
          ? PortraitOrientationDetailsWidget(
              temperature: temperature,
              townName: townName,
              icon: icon,
            )
          : HorizontalOrientationDetailsWidget(
              temperature: temperature,
              townName: townName,
              icon: icon,
            );
    });
  }
}
