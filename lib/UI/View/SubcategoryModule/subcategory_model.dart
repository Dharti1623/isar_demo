import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../../../Config/Services/isar_service.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Data/Localization/Entities/subcategory.dart';
import '../../../Utils/string_constant.dart';

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
    return SafeArea(
      child: Form(
        key: subcategoryFormKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(enterSubcategoryDataTxt,
                  style: Theme.of(context).textTheme.headlineSmall),
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
                      return MultiSelectItem<Categories>(category, category.categoryName);
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
              ElevatedButton(
                  onPressed: () async {
                    if (subcategoryFormKey.currentState!.validate()) {
                      widget.service.saveSubcategory(
                        Subcategories()
                          ..subcategoryName = subcategoryTxtController.text
                          ..categories.addAll(selectedCategories),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                "New Subcategory '${subcategoryTxtController.text}' saved in DB")),
                      );

                      Navigator.pop(context);
                    }
                  },
                  child: const Text("Add new Subcategory"))
            ],
          ),
        ),
      ),
    );
  }
}

