import 'package:eight_app_weather_test/data/blocs/internet_connection_bloc/internet_connection_bloc.dart';
import 'package:eight_app_weather_test/data/entities/town.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/utils/utils.dart';
import '../../../../generated/l10n.dart';
import '../../../navigation/main_navigation.dart';
import '../../../theme/app_theme.dart';
import '../../../theme/text_style.dart';

class TownListTileWidget extends StatelessWidget {
  final String townName;
  final String searchValue;
  const TownListTileWidget({
    Key? key,
    required this.townName,
    required this.searchValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final internetConnectionState =
        context.watch<InternetConnectionBloc>().state;

    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Container(
        width: 327,
        height: 59,
        decoration: AppTheme.listItemsDecoration,
        child: GestureDetector(
          onTap: () {
            internetConnectionState.maybeWhen(
              orElse: () => Utils.showErrorSnackBar(
                context,
                S.of(context).getWeather_error_message,
              ),
              connected: (status) => Navigator.pushNamed(
                context,
                MainNavigationRouteNames.weatherDetailScreen,
                arguments: Town(name: townName, searchValue: searchValue),
              ),
            );
          },
          child: ListTile(
            title: Text(
              townName,
              textAlign: TextAlign.center,
              style: AppTextStyle.normal,
            ),
          ),
        ),
      ),
    );
  }
}
