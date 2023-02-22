import 'package:categories/UI/View/SubcategoryModule/subcategory_model.dart';
import 'package:flutter/material.dart';

import '../../Config/Services/isar_service.dart';
import '../../Utils/common_style.dart';
import '../../Utils/string_constant.dart';
import '../View/CategoryModule/category_model.dart';
import 'delete_all_data.dart';

customCatAppBar(BuildContext context, appbarTitle, IsarService services, tabs,
    TabController tabController) {
  return AppBar(
    centerTitle: true,
    title: Text(appbarTitle),
    actions: [
      AddDataPopUpMenu(),
      IconButton(
        onPressed: () {
          deleteAllData(context, services);
        },
        icon: const Icon(Icons.delete),
        tooltip: clearDataTxt,
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size(MediaQuery.of(context).size.width,
          MediaQuery.of(context).size.height * 0.08),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: TabBar(
          controller: tabController,
          isScrollable: true,
          unselectedLabelColor: Colors.cyan,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: Colors.cyan,
            border: Border.all(
                color: Colors.tealAccent,
                strokeAlign: BorderSide.strokeAlignInside,
                style: BorderStyle.solid),
            boxShadow: const [
              BoxShadow(
                color: Colors.cyanAccent,
                blurRadius: 8,
                spreadRadius: 5,
              ),
            ],
            borderRadius: BorderRadius.circular(57),
          ),
          tabs: tabs,

// indicatorColor: AppColor.iconBlack,
        ),
      ),
    ),
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
