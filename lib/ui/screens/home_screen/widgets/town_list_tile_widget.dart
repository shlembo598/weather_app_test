import 'package:eight_app_weather_test/data/entities/town.dart';
import 'package:flutter/material.dart';

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
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
      child: Container(
        width: 327,
        height: 59,
        decoration: AppTheme.listItemsDecoration,
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(
            context,
            MainNavigationRouteNames.weatherDetailScreen,
            arguments: Town(name: townName, searchValue: searchValue),
          ),
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
