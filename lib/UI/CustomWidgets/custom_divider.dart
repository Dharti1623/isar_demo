import 'package:flutter/material.dart';

import '../../Utils/color_constant.dart';

// ignore: must_be_immutable
class TracksDivider extends StatelessWidget {
  double lineThickNess;

  TracksDivider(this.lineThickNess, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      indent: 5.0,
      color: AppColor.bgClr,
      thickness: lineThickNess,
    );
  }
}
