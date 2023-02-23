import 'package:categories/UI/View/SubcategoryModule/subcategory_model.dart';
import 'package:flutter/material.dart';

import '../../Config/Services/isar_service.dart';
import '../../Utils/common_icon.dart';
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
        icon:customIcon(Icons.delete,25,AppColor.fontWhiteClr),
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
          unselectedLabelColor: AppColor.bgClr,
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            color: AppColor.bgClr,
            border: Border.all(
                color: AppColor.borderClr,
                strokeAlign: BorderSide.strokeAlignInside,
                style: BorderStyle.solid),
            boxShadow: [
              BoxShadow(
                color: AppColor.shadowClr,
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
        icon:  customIcon(Icons.add_chart,25,AppColor.fontWhiteClr),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
              value: 0,
              child: Text(categoryTxt, style: menuTxtStyle),
            ),
            PopupMenuItem<int>(
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
