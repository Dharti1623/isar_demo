import 'package:categories/Data/Localization/Entities/subcategory.dart';
import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
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

  @override
  void initState() {
    editSubcategoryTxtController.text = widget.subcategoryData.subcategoryName;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(subcategoryTxt,
          style: Theme.of(context).textTheme.headlineSmall),
      content: Form(
        key: editSubcategoryFormKey,
        child: TextFormField(
          controller: editSubcategoryTxtController,
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
            if (editSubcategoryFormKey.currentState!.validate()) {
              widget.service.updateSubcategory(
                  widget.subcategoryData.id, editSubcategoryTxtController.text);
              commonSuccessSnackBar(context, doneUpdateMsg);
              Navigator.pop(context);
            }
          },
          child: Text(addTxt,style: Theme.of(context).textTheme.titleMedium),
        ),
      ],
    );
  }
}
