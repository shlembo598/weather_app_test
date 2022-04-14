import 'package:flutter/material.dart';

import '../../../theme/text_style.dart';

class TemperatureWidget extends StatelessWidget {
  const TemperatureWidget({
    Key? key,
    required this.temperature,
  }) : super(key: key);

  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          temperature,
          style: AppTextStyle.large,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            '\u00B0',
            style: AppTextStyle.normal,
          ),
        ),
      ],
    );
  }
}
