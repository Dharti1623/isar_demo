import 'package:flutter/material.dart';

import '../../Utils/string_constant.dart';

customAppBar(BuildContext context, appbarTitle, services) {
  return AppBar(
    centerTitle: true,
    title: Text(appbarTitle),
    actions: [
      IconButton(
        onPressed: () => services.cleanDb(),
        icon: const Icon(Icons.delete),
        tooltip: clearDataTxt,
      ),
    ],
  );
}
