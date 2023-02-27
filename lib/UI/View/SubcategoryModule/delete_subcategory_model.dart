import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../../Config/Services/isar_service.dart';
import '../../../Utils/text_style_constant.dart';
import '../../CustomWidgets/custom_success_msg.dart';

// ignore: must_be_immutable
class DeleteSubcategoryModel extends StatelessWidget {
  final IsarService service;
  int subcategoryId;

  DeleteSubcategoryModel(this.service, this.subcategoryId, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title:
          Text(StringConstants.confirmDeleteMsg, style: AppTextStyle.confirmDeleteMsgTxtStyle),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, right: 4),
                  child: ElevatedButton(
                    onPressed: () async {
                      service.deleteSubcategory(subcategoryId);
                      commonSuccessSnackBar(context, StringConstants.doneDeleteMsg);
                      Navigator.pop(context);
                    },
                    child:
                    Text('Yes', style: AppTextStyle.modelButtonTxtStyle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child:
                    Text('No', style: AppTextStyle.modelButtonTxtStyle),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
