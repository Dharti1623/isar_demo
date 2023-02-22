import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
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
          title: Text(categoryTxt,style: Theme.of(context).textTheme.headlineSmall),
          content: Form(
            key: editCategoryFormKey,
            child: TextFormField(
              controller: editCategoryTxtController,
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return errorMessageTxt;
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
              child: Text(cancelTxt,style: Theme.of(context).textTheme.titleMedium),
            ),
            ElevatedButton(
              onPressed: () async {
                if (editCategoryFormKey.currentState!.validate()) {
                  widget.service.updateCategory(widget.categoryData.id,editCategoryTxtController.text);
                  commonSuccessSnackBar(context,doneUpdateMsg);
                  Navigator.pop(context);
                }
              },
              child: Text(addTxt,style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
