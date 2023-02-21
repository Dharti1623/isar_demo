import 'package:flutter/material.dart';

commonSuccessSnackBar(BuildContext context, msg) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg), backgroundColor: Colors.cyan));
}
