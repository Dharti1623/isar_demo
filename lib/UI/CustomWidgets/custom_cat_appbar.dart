import 'package:categories/UI/View/SubcategoryModule/subcategory_model.dart';
import 'package:flutter/material.dart';

import '../../Config/Services/isar_service.dart';
import '../../Utils/common_style.dart';
import '../../Utils/string_constant.dart';
import '../View/CategoryModule/category_model.dart';

customCatAppBar(BuildContext context, appbarTitle, services) {
  return AppBar(
    centerTitle: true,
    title: Text(appbarTitle),
    actions: [
      AddDataPopUpMenu(),
      IconButton(
        onPressed: () => services.cleanDb(),
        icon: const Icon(Icons.delete),
        tooltip: clearDataTxt,
      ),
    ],
  );
}

class AddDataPopUpMenu extends StatelessWidget {
  AddDataPopUpMenu({Key? key}) : super(key: key);
  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        icon: const Icon(Icons.add_chart),
        itemBuilder: (context) {
          return [
            const PopupMenuItem<int>(
              value: 0,
              child: Text(categoryTxt, style: menuTxtStyle),
            ),
            const PopupMenuItem<int>(
              value: 1,
              child: Text(subcategoryTxt, style: menuTxtStyle),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 0) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => CategoryModel(service));
          } else if (value == 1) {
            showDialog(
                barrierDismissible: false,
                context: context,
                builder: (context) => SubcategoryModel(service));
          }
        });
  }
}
