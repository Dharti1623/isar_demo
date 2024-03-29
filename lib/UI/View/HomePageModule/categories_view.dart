import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Utils/color_constant.dart';
import '../../../Utils/common_icon.dart';
import '../../../Utils/string_constant.dart';
import '../../../Utils/text_style_constant.dart';
import '../CategoryModule/delete_category_model.dart';
import '../CategoryModule/edit_category_model.dart';
import 'subcategories_by_category.dart';

// ignore: must_be_immutable
class CategoriesView extends StatelessWidget {
  IsarService service;

  CategoriesView(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<List<Categories>>(
            stream: service.listenToCategories(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              if (snapshot.hasData) {
                final subcategoriesData = snapshot.data!;
                if (subcategoriesData.isEmpty) {
                  return Center(
                      child: Text(StringConstants.noDataAvailableTxt,
                          style: AppTextStyle.modelTitleTxtStyle));
                }
                return GridView.count(
                  physics: const BouncingScrollPhysics(),
                  childAspectRatio: 2 / 2,
                  crossAxisCount: 2,
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
                                  color: AppColor.bgClr,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                        alignment: Alignment.topRight,
                                        child: IconButton(
                                          onPressed: () {
                                            CategoryDetailsPage.navigate(
                                                context, category, service);
                                          },
                                          icon: customIcon(Icons.remove_red_eye,
                                              19, AppColor.fontWhiteClr),
                                        )),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: Align(
                                          alignment: Alignment.bottomCenter,
                                          child: Text(category.categoryName,
                                              maxLines: 1,
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppTextStyle
                                                  .categoryTitleTxtStyle)),
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
                                                      DeleteCategoryModel(
                                                          service,
                                                          category.id));
                                            },
                                            icon: customIcon(Icons.delete, 18,
                                                AppColor.fontWhiteClr)),
                                        IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) =>
                                                      EditCategoryModel(
                                                          service, category));
                                            },
                                            icon: customIcon(Icons.edit, 18,
                                                AppColor.fontWhiteClr)),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()
                      : [],
                );
              }
              return const Center(child: CircularProgressIndicator());
            }),
      ),
    );
  }
}
