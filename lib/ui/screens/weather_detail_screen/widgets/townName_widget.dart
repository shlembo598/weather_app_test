import 'package:flutter/material.dart';

import '../../../theme/text_style.dart';

class TownNameWidget extends StatelessWidget {
  const TownNameWidget({
    Key? key,
    required this.townName,
  }) : super(key: key);

  final String townName;

  @override
  Widget build(BuildContext context) {
    return Text(
      townName,
      style: AppTextStyle.middle,
    );
  }
}
