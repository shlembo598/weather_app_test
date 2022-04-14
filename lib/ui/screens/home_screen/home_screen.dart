import 'package:eight_app_weather_test/ui/screens/home_screen/widgets/towns_list_widget.dart';
import 'package:flutter/material.dart';

import '../../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(S.of(context).app_title)),
      ),
      body: const TownsListWidget(),
    );
  }
}
