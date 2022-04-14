import 'package:eight_app_weather_test/ui/screens/home_screen/widgets/town_list_tile_widget.dart';
import 'package:flutter/material.dart';

import '../../../../data/constants/constants.dart';

class TownsListWidget extends StatelessWidget {
  const TownsListWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: townNames.length,
      itemBuilder: (context, index) {
        String townName = townNames.keys.elementAt(index);
        String? searchValue = townNames[townName];

        return TownListTileWidget(
          townName: townName,
          searchValue: searchValue ?? '',
        );
      },
    );
  }
}
