import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';
import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';

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
    return AlertDialog(
      title: Text(categoryTxt),
      content: Form(
        key: editCategoryFormKey,
        child: TextFormField(
          controller: editCategoryTxtController,
          decoration: InputDecoration(
            // hintText: categoryTxtController.text,
            labelText: editCategoryTxtController.text,
          ),
          // autofocus: true,
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
          child: Text(cancelTxt),
        ),
        ElevatedButton(
          onPressed: () async {
            if (editCategoryFormKey.currentState!.validate()) {
              widget.service.saveCategory(
                  Categories()..categoryName = editCategoryTxtController.text);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "New Category '${editCategoryTxtController.text}' saved in DB")));

              Navigator.pop(context);
            }
          },
          child: Text(addTxt),
        ),
      ],
    );
    /*return Form(
      key: categoryFormKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(enterCategoryDataTxt,
                style: Theme.of(context).textTheme.headlineSmall),
            TextFormField(
              controller: categoryTxtController,
              autofocus: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return errorMessageTxt;
                }
                return null;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  if (categoryFormKey.currentState!.validate()) {
                    widget.service.saveCategory(Categories()..categoryName = categoryTxtController.text);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                            "New Category '${categoryTxtController.text}' saved in DB")));

                    Navigator.pop(context);
                  }
                },
                child: const Text("Add new Category"))
          ],
        ),
      ),
    );*/
  }
}
