import 'package:eight_app_weather_test/generated/l10n.dart';
import 'package:eight_app_weather_test/ui/theme/text_style.dart';
import 'package:flutter/material.dart';

class DetailScreenErrorWidget extends StatelessWidget {
  const DetailScreenErrorWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
            size: 100,
          ),
          Text(
            S.of(context).weatherScreen_error_message,
            style: AppTextStyle.normal,
          ),
        ],
      ),
    );
  }
}
