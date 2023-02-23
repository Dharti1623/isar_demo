import 'package:flutter/material.dart';

import '../../Utils/string_constant.dart';

commonSuccessSnackBar(BuildContext context, msg) {
  return ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg), backgroundColor: AppColor.bgClr));
}
