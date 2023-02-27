import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Utils/text_style_constant.dart';
import '../../CustomWidgets/custom_success_msg.dart';

// ignore: must_be_immutable
class EditCategoryModel extends StatefulWidget {
  final IsarService service;
  Categories categoryData;

  EditCategoryModel(this.service,this.categoryData, {Key? key}) : super(key: key);

  @override
  State<EditCategoryModel> createState() => _EditCategoryModelState();
}

class _EditCategoryModelState extends State<EditCategoryModel> {
  final editCategoryFormKey = GlobalKey<FormState>();
  final editCategoryTxtController = TextEditingController();

  @override
  void initState() {
    editCategoryTxtController.text = widget.categoryData.categoryName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text(StringConstants.categoryTxt,style: AppTextStyle.modelTitleTxtStyle),
          content: Form(
            key: editCategoryFormKey,
            child: TextFormField(
              controller: editCategoryTxtController,
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return StringConstants.errorMessageTxt;
                }
                return null;
              },
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(StringConstants.cancelTxt,style: AppTextStyle.modelButtonTxtStyle),
            ),
            ElevatedButton(
              onPressed: () async {
                if (editCategoryFormKey.currentState!.validate()) {
                  widget.service.updateCategory(widget.categoryData.id,editCategoryTxtController.text);
                  commonSuccessSnackBar(context,StringConstants.doneUpdateMsg);
                  Navigator.pop(context);
                }
              },
              child: Text(StringConstants.addTxt,style: AppTextStyle.modelButtonTxtStyle),
            ),
          ],
        ),
      ),
    );
  }
}
