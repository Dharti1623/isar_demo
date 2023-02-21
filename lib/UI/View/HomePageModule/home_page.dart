import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Utils/string_constant.dart';
import '../../CustomWidgets/custom_cat_appbar.dart';
import '../CategoryModule/category_detail_page.dart';
import '../CategoryModule/delete_category_model.dart';
import '../CategoryModule/edit_category_model.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCatAppBar(context, categoriesTxt, service),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: StreamBuilder<List<Categories>>(
            stream: service.listenToCategories(),
            builder: (context, snapshot) => GridView.count(
              physics: const BouncingScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              scrollDirection: Axis.vertical,
              children: snapshot.hasData
                  ? snapshot.data!.map((category) {
                      return InkWell(
                        onTap: () {
                          CategoryDetailsPage.navigate(
                              context, category, service);
                        },
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.cyan,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) =>
                                                    DeleteCategoryModel(
                                                        service, category.id));
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            size: 20,
                                          ))),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text(category.categoryName,
                                            maxLines: 1,
                                            softWrap: true,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge)),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            showDialog(
                                                barrierDismissible: false,
                                                context: context,
                                                builder: (context) =>
                                                    EditCategoryModel(
                                                        service, category));
                                          },
                                          icon:
                                              const Icon(Icons.edit, size: 20)),
                                      IconButton(
                                          onPressed: () {
                                            CategoryDetailsPage.navigate(
                                                context, category, service);
                                          },
                                          icon: const Icon(Icons.remove_red_eye,
                                              size: 20)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    }).toList()
                  : [],
            ),
          ),
        ),
      ),
    );
  }
}
