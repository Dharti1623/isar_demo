import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../CustomWidgets/custom_success_msg.dart';

// ignore: must_be_immutable
class DeleteCategoryModel extends StatelessWidget {
  final IsarService service;
  int categoryId;

  DeleteCategoryModel(this.service, this.categoryId, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title:
          Text(confirmDeleteMsg, style: Theme.of(context).textTheme.titleLarge),
      icon: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.close, color: Colors.cyan, size: 30)),
      iconPadding:
          EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.7),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4, right: 4),
              child: ElevatedButton(
                onPressed: () async {
                  service.deleteCategory(categoryId);
                  commonSuccessSnackBar(context, doneDeleteMsg);
                  Navigator.pop(context);
                },
                child:
                    Text('Yes', style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child:
                    Text('No', style: Theme.of(context).textTheme.titleMedium),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
