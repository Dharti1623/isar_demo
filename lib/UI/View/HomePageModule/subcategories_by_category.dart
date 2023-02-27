import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Data/Localization/Entities/subcategory.dart';
import '../../../Utils/text_style_constant.dart';
import '../../../Utils/string_constant.dart';
import '../../CustomWidgets/custom_divider.dart';
import '../../CustomWidgets/custom_subcategory_appbar.dart';

class CategoryDetailsPage extends StatelessWidget {
  final Categories categoryData;
  final IsarService service;

  static void navigate(context, Categories category, IsarService service) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoryDetailsPage(categoryData: category, service: service);
    }));
  }

  const CategoryDetailsPage(
      {Key? key, required this.categoryData, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          customSubcategoryAppBar(context, categoryData.categoryName, service),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10,top: 10,right: 5,left: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: Text(StringConstants.subcategoriesTxt,
                    style: AppTextStyle.modelTitleTxtStyle,
                    textAlign: TextAlign.center)),
            Expanded(
              child: SafeArea(
                child: FutureBuilder<List<Subcategories>>(
                  future: service.getSubCatData(categoryData),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text(snapshot.error.toString());
                    }
                    if (snapshot.hasData) {
                      final subcategoriesData = snapshot.data!;
                      if (subcategoriesData.isEmpty) {
                        return Center(child: Text(StringConstants.noDataAvailableTxt,style: AppTextStyle.modelTitleTxtStyle));
                      }
                      return ListView.separated(
                          separatorBuilder: (context, index) =>
                              Padding(
                                padding: const EdgeInsets.only(right: 10,left: 5),
                                child: TracksDivider(2),
                              ),
                          physics: const BouncingScrollPhysics(),
                          itemCount: subcategoriesData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            '${index + 1}.${subcategoriesData[index].subcategoryName}',
                                            style: AppTextStyle.confirmDeleteMsgTxtStyle,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          });
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
