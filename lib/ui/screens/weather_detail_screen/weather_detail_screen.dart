import 'package:eight_app_weather_test/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/weather_detail_bloc/weather_detail_bloc.dart';
import '../../theme/text_style.dart';
import 'widgets/weather_detail_screen_widgets.dart';

class WeatherDetailScreen extends StatelessWidget {
  const WeatherDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherBlocState = context.watch<WeatherDetailBloc>().state;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: weatherBlocState.maybeWhen(
          orElse: () => const SizedBox.shrink(),
          loading: () => const Center(child: CircularProgressIndicator()),
          loaded: (townName, temperature, icon) => WeatherDetailWidget(
            townName: townName,
            temperature: temperature,
            icon: icon,
          ),
          error: () => Center(
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
          ),
        ),
      ),
    );
  }
}
