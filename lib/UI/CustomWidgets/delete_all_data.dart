import 'package:categories/Utils/string_constant.dart';
import 'package:flutter/material.dart';

import '../../Config/Services/isar_service.dart';
import '../../Utils/common_style.dart';

// ignore: must_be_immutable
class DeleteDatabase extends StatelessWidget {
  final IsarService service;

  const DeleteDatabase(this.service, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: AlertDialog(
          title: Text(confirmDeleteMsg,
              style: confirmDeleteMsgTxtStyle),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 4, right: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      service.cleanDb();
                      Navigator.pop(context);
                    },
                    child: Text('Yes',
                        style: modelButtonTxtStyle),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('No',
                        style: modelButtonTxtStyle),
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

deleteAllData(BuildContext context, IsarService service) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => DeleteDatabase(service));
}
