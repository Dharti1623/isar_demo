import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../CustomWidgets/custom_success_msg.dart';

class CategoryModel extends StatefulWidget {
  final IsarService service;

  const CategoryModel(this.service, {Key? key}) : super(key: key);

  @override
  State<CategoryModel> createState() => _CategoryModelState();
}

class _CategoryModelState extends State<CategoryModel> {
  final categoryFormKey = GlobalKey<FormState>();
  final categoryTxtController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title:
              Text(categoryTxt, style: Theme.of(context).textTheme.headlineSmall),
          content: Form(
            key: categoryFormKey,
            child: TextFormField(
              controller: categoryTxtController,
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
              child:
                  Text(cancelTxt, style: Theme.of(context).textTheme.titleMedium),
            ),
            ElevatedButton(
              onPressed: () async {
                if (categoryFormKey.currentState!.validate()) {
                  widget.service.insertCategory(
                      Categories()..categoryName = categoryTxtController.text);
                  commonSuccessSnackBar(context, doneInsertMsg);
                  Navigator.pop(context);
                }
              },
              child: Text(addTxt, style: Theme.of(context).textTheme.titleMedium),
            ),
          ],
        ),
      ),
    );
  }
}
