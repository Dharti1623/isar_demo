import 'package:flutter/material.dart';

import '../../Utils/color_constant.dart';

commonSuccessSnackBar(BuildContext context, msg) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg), backgroundColor: AppColor.bgClr));
}
