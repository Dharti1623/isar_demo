import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';
import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';

class CategoryModel extends StatefulWidget {
  final IsarService service;
  // Categories category;

  CategoryModel(this.service, {Categories? categoryData,Key? key}) : super(key: key);

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
    return AlertDialog(
      title: Text(categoryTxt),
      content: Form(
        key: categoryFormKey,
        child: TextFormField(
          controller: categoryTxtController,
          decoration: InputDecoration(
            // hintText: categoryTxtController.text,
            labelText: categoryTxtController.text,
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
            if (categoryFormKey.currentState!.validate()) {
              widget.service.saveCategory(
                  Categories()..categoryName = categoryTxtController.text);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      "New Category '${categoryTxtController.text}' saved in DB")));

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
