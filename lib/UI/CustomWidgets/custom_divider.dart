import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TracksDivider extends StatelessWidget {
  double lineThickNess;

  TracksDivider(this.lineThickNess, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Divider(
          indent: 5.0,
          color: Colors.cyan,
          thickness: lineThickNess,
        ));
  }
}
