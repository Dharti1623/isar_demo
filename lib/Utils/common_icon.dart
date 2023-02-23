import 'package:flutter/material.dart';

/*
// ignore: must_be_immutable
class customIcon extends StatelessWidget {
  IconData icon;
  double iconSize;
  Color iconClr;
  customIcon(this.icon, this.iconSize,this.iconClr , {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: iconClr, size: iconSize);
  }
}
*/

customIcon(IconData icon,double iconSize,Color iconClr){
  return Icon(icon, color: iconClr, size: iconSize);
}