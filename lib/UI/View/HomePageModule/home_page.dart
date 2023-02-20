import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Utils/string_constant.dart';
import '../../CustomWidgets/custom_appbar.dart';
import '../CategoryModule/category_detail_page.dart';
import '../CategoryModule/category_model.dart';
import '../CategoryModule/editCategory_model.dart';
import '../SubcategoryModule/subcategory_model.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final service = IsarService();

  @override
  Widget build(BuildContext context) {
    final categoryEditFormKey = GlobalKey<FormState>();
    final categoryEditTxtController = TextEditingController();
    return Scaffold(
      appBar: customAppBar(context, categoriesTxt, service),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: StreamBuilder<List<Categories>>(
                stream: service.listenToCategories(),
                builder: (context, snapshot) =>
                    GridView.count(
                      physics: const BouncingScrollPhysics(),
                      crossAxisCount: 3,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      // scrollDirection: Axis.horizontal,
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
                              child: Column(
                                children: [
                                  Align(
                                      alignment: Alignment.topRight,
                                      child: IconButton(
                                          onPressed: () {
                                            print('-->{$category.categoryName}');
                                            showDialog(
                                                context: context,
                                                builder: (context) => EditCategoryModel(service,category));
                                          },
                                          icon: const Icon(Icons.edit))),
                                  Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        category.categoryName,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                      )),
                                ],
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
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width / 2,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => CategoryModel(service));

                // showModalBottomSheet(
                //     context: context,
                //     builder: (context) {
                //       return CategoryModel(service);
                //     });
              },
              child: const Text('Add $categoryTxt'),
            ),
          ),
          SizedBox(
            width: MediaQuery
                .of(context)
                .size
                .width / 2,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return SubcategoryModel(service);
                    });
              },
              child: const Text('Add $subcategoryTxt'),
            ),
          ),
        ],
      ),
    );
  }
}