import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/blocs/weather_detail_bloc/weather_detail_bloc.dart';
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
          loaded: (townName, temperature, icon) => WeatherDetailWidget(
            townName: townName,
            temperature: temperature,
            icon: icon,
          ),
        ),
      ),
    );
  }
}
