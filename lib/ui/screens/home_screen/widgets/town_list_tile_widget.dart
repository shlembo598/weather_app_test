import 'package:eight_app_weather_test/data/blocs/internet_connection_bloc/internet_connection_bloc.dart';
import 'package:eight_app_weather_test/data/entities/town.dart';
import 'package:eight_app_weather_test/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/utils/utils.dart';
import '../../../../generated/l10n.dart';
import '../../../navigation/main_navigation.dart';
import '../../../theme/text_style.dart';

class TownListTileWidget extends StatelessWidget {
  final Town town;

  const TownListTileWidget({
    Key? key,
    required this.town,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final internetConnectionState =
        context.watch<InternetConnectionBloc>().state;
    final borderRadius = BorderRadius.circular(11);

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Card(
        color: AppTheme.listTileColor,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        child: InkWell(
          borderRadius: borderRadius,
          onTap: () =>
              _openDetailsScreen(internetConnectionState, context, town),
          child: Ink(
            width: 327,
            height: 59,
            child: Center(
              child: Text(
                town.name,
                style: AppTextStyle.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  static _openDetailsScreen(
    InternetConnectionState state,
    BuildContext context,
    Town town,
  ) {
    state.maybeWhen(
      orElse: () => Utils.showErrorSnackBar(
        context,
        S.of(context).getWeather_error_message,
      ),
      connected: (status) => Navigator.pushNamed(
        context,
        MainNavigationRouteNames.weatherDetailScreen,
        arguments: town,
      ),
    );
  }
}
