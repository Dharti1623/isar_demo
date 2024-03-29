import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/subcategory.dart';
import '../../../Utils/color_constant.dart';
import '../../../Utils/common_icon.dart';
import '../../../Utils/string_constant.dart';
import '../../../Utils/text_style_constant.dart';
import '../../CustomWidgets/custom_divider.dart';
import '../SubcategoryModule/delete_subcategory_model.dart';
import '../SubcategoryModule/editSubcategory_model.dart';

class SubcategoryView extends StatelessWidget {
  final IsarService service;

  const SubcategoryView(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 10, top: 10, right: 5, left: 5),
        child: Column(
          children: [
            Expanded(
              child: SafeArea(
                child: StreamBuilder<List<Subcategories>>(
                  stream: service.listenToSubcategories(),
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
                      return ListView.separated(
                          separatorBuilder: (context, index) =>
                              TracksDivider(2),
                          physics: const BouncingScrollPhysics(),
                          itemCount: subcategoriesData.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(left: 8),
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
                                            style: AppTextStyle
                                                .confirmDeleteMsgTxtStyle,
                                            textAlign: TextAlign.center,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  useSafeArea: false,
                                                  context: context,
                                                  builder: (context) =>
                                                      EditSubcategoryModel(
                                                          service,
                                                          subcategoriesData[
                                                              index]));
                                            },
                                            icon: customIcon(
                                                Icons.edit, 22, AppColor.bgClr),
                                            tooltip: 'Edit Subcategory',
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (context) =>
                                                      DeleteSubcategoryModel(
                                                          service,
                                                          subcategoriesData[
                                                                  index]
                                                              .id));
                                            },
                                            icon: customIcon(Icons.delete, 22,
                                                AppColor.bgClr),
                                            tooltip: 'Delete SubCategory',
                                          ),
                                        ],
                                      )
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
