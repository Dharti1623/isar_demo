import 'package:categories/Data/Localization/Entities/subcategory.dart';
import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Utils/common_icon.dart';
import '../../../Utils/common_style.dart';
import '../../CustomWidgets/custom_success_msg.dart';

// ignore: must_be_immutable
class EditSubcategoryModel extends StatefulWidget {
  final IsarService service;
  Subcategories subcategoryData;

  EditSubcategoryModel(this.service, this.subcategoryData, {Key? key})
      : super(key: key);

  @override
  State<EditSubcategoryModel> createState() => _EditSubcategoryModelState();
}

class _EditSubcategoryModelState extends State<EditSubcategoryModel> {
  final editSubcategoryFormKey = GlobalKey<FormState>();
  final editSubcategoryTxtController = TextEditingController();
  List<Categories> selectedCategories = [];
  List<Categories> selectedCategoriesD = [];

  @override
  void initState() {
    // dataL();
    editSubcategoryTxtController.text = widget.subcategoryData.subcategoryName;
    // widget.subcategoryData.categories.map((categoryData){
    //   print('--->${categoryData.categoryName}');
    //   selectedCategoriesD.add(categoryData);
    // });
    // selectedCategories = widget.subcategoryData.categories.toList();
    super.initState();
  }
   // Future<void> dataL() async {
   //   widget.subcategoryData.categories.map((e) => print('-->$e'));
   //      }

       // return <Categories>(categoryData.categoryName);}).toList(growable: false);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text(subcategoryTxt, style: modelTitleTxtStyle),
          content: Form(
            key: editSubcategoryFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: editSubcategoryTxtController,
                  autofocus: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return errorMessageTxt;
                    }
                    return null;
                  },
                ),
                FutureBuilder<List<Categories>>(
                  future: widget.service.getAllCategories(),
                  builder: (context, AsyncSnapshot<List<Categories>> snapshot) {
                    if (snapshot.hasData) {
                      print('selectedCategories--->${selectedCategoriesD}');
                      final categories = snapshot.data!.map((category) {
                        return MultiSelectItem<Categories>(
                            category, category.categoryName);
                      }).toList();
                      return Center(
                        child: MultiSelectDialogField<Categories>(
                          items: categories,
                          searchable: true,
                          initialValue: selectedCategoriesD,
                          isDismissible: false,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          searchTextStyle: selectButtonTxtStyle,
                          searchHintStyle: selectButtonTxtStyle,
                          itemsTextStyle: selectButtonTxtStyle,
                          selectedItemsTextStyle: selectButtonTxtStyle,
                          unselectedColor: AppColor.bgClr,
                          selectedColor: AppColor.bgClr,
                          checkColor: AppColor.fontWhiteClr,
                          backgroundColor: AppColor.fontWhiteClr,
                          barrierColor: AppColor.transparentClr,
                          searchIcon:
                              customIcon(Icons.search, 20, AppColor.bgClr),
                          closeSearchIcon:
                              customIcon(Icons.close, 20, AppColor.bgClr),
                          buttonText:
                              Text(categoriesTxt, style: selectButtonTxtStyle),
                          cancelText:
                              Text(cancelTxt, style: selectButtonTxtStyle),
                          title: Text('Select $categoriesTxt',
                              style: confirmDeleteMsgTxtStyle),
                          confirmText: Text('Ok', style: selectButtonTxtStyle),
                          onConfirm: (value) {
                            selectedCategories = value;
                          },
                          validator: (value) {
                            if (value == [] || value == null || value.isEmpty) {
                              return errorMessageTxt;
                            }
                            return null;
                          },
                          dialogHeight:
                              MediaQuery.of(context).size.height * 0.3,
                        ),
                      );
                    }
                    return const Center(child: CircularProgressIndicator());
                  },
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(cancelTxt, style: modelButtonTxtStyle),
            ),
            ElevatedButton(
              onPressed: () async {
                if (editSubcategoryFormKey.currentState!.validate()) {
                  widget.service.updateSubcategory(widget.subcategoryData.id,Subcategories()
                      ..subcategoryName = editSubcategoryTxtController.text
                      ..categories.addAll(selectedCategories),
                  );
                  commonSuccessSnackBar(context, doneUpdateMsg);
                  Navigator.pop(context);
                }
              },
              child: Text(addTxt, style: modelButtonTxtStyle),
            ),
          ],
        ),
      ),
    );
  }
}
