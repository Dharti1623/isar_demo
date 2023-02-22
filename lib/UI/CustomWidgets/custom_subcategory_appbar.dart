import 'package:flutter/material.dart';

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
      icon: const Icon(
        Icons.arrow_back_ios_new_sharp,
        size: 30,
      ),
      tooltip: clearDataTxt,
    ),
    actions: [
      IconButton(
        onPressed: () {
          deleteAllData(context,services);
        },
        icon: const Icon(Icons.delete, size: 25),
        tooltip: clearDataTxt,
      ),
    ],
  );
}
