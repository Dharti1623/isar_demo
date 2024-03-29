import 'package:categories/UI/View/HomePageModule/subcategory_view.dart';
import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Utils/text_style_constant.dart';
import '../../../Utils/string_constant.dart';
import '../../CustomWidgets/custom_cat_appbar.dart';
import 'categories_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final service = IsarService();
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Tab> tabs = <Tab>[
      Tab(
          child: Text(
            StringConstants.categoriesTxt,
        style: AppTextStyle.categoryTitleTxtStyle,
      )),
      Tab(
          child: Text(
            StringConstants.subcategoriesTxt,
        style: AppTextStyle.categoryTitleTxtStyle,
      )),
    ];
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: customCatAppBar(
            context, StringConstants.categoriesTxt, service, tabs, tabController),
        body: TabBarView(
            controller: tabController,
            physics: const BouncingScrollPhysics(),
            children: [CategoriesView(service), SubcategoryView(service)]),
      ),
    );
  }
}
