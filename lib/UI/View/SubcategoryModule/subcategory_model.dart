import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Data/Localization/Entities/subcategory.dart';
import '../../../Utils/common_style.dart';
import '../../../Utils/string_constant.dart';
import '../../CustomWidgets/custom_success_msg.dart';

class SubcategoryModel extends StatefulWidget {
  final IsarService service;

  const SubcategoryModel(this.service, {Key? key}) : super(key: key);

  @override
  State<SubcategoryModel> createState() => _SubcategoryModelState();
}

class _SubcategoryModelState extends State<SubcategoryModel> {
  final subcategoryFormKey = GlobalKey<FormState>();
  final subcategoryTxtController = TextEditingController();
  List<Categories> selectedCategories = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text(subcategoryTxt,
              style: modelTitleTxtStyle),
          content: Form(
            key: subcategoryFormKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: subcategoryTxtController,
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
                      final categories = snapshot.data!.map((category) {
                        return MultiSelectItem<Categories>(
                            category, category.categoryName);
                      }).toList();

                      return MultiSelectDialogField<Categories>(
                          items: categories,
                          onConfirm: (value) {
                            selectedCategories = value;
                          });
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
              child:
                  Text(cancelTxt, style: modelButtonTxtStyle),
            ),
            ElevatedButton(
              onPressed: () async {
                if (subcategoryFormKey.currentState!.validate()) {
                  widget.service.insertSubcategory(
                    Subcategories()
                      ..subcategoryName = subcategoryTxtController.text
                      ..categories.addAll(selectedCategories),
                  );
                  commonSuccessSnackBar(context, doneInsertMsg);
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
