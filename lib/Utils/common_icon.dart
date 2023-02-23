import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomIcon extends StatelessWidget {
  IconData icon;
  double iconSize;
  Color iconClr;
  CustomIcon(this.icon, this.iconSize,this.iconClr , {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: iconClr, size: iconSize);
  }
}