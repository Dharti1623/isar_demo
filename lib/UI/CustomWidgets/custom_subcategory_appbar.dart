import 'package:flutter/material.dart';

import '../../Utils/color_constant.dart';
import '../../Utils/common_icon.dart';
import '../../Utils/string_constant.dart';
import 'delete_all_data.dart';

customSubcategoryAppBar(BuildContext context, appbarTitle, services) {
  return AppBar(
    centerTitle: true,
    title: Text(appbarTitle),
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: customIcon(Icons.arrow_back_ios_new_sharp, 30,AppColor.fontWhiteClr),
      tooltip: StringConstants.clearDataTxt,
    ),
    actions: [
      IconButton(
        onPressed: () {
          deleteAllData(context, services);
        },
        icon: customIcon(Icons.delete,25,AppColor.fontWhiteClr),
        tooltip: StringConstants.clearDataTxt,
      ),
    ],
  );
}
