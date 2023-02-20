import 'package:flutter/material.dart';
import '../../../Data/Localization/Entities/category.dart';
import '../../../Data/Localization/Entities/subcategory.dart';
import '../../../Utils/string_constant.dart';
import '../../CustomWidgets/custom_appbar.dart';
import '../../../Config/Services/isar_service.dart';

class CategoryDetailsPage extends StatelessWidget {
  final Categories categoryData;
  final IsarService service;

  static void navigate(context, Categories category, IsarService service) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return CategoryDetailsPage(categoryData: category, service: service);
    }));
  }

  const CategoryDetailsPage(
      {Key? key, required this.categoryData, required this.service})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, categoryData.categoryName, service),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(subcategoriesTxt),
            Expanded(
              child: FutureBuilder<List<Subcategories>>(
                future: service.getSubcategoriesByCategory(categoryData),
                builder: (context, snapshot) {
                  if (snapshot.hasError) return Text(snapshot.error.toString());
                  if (snapshot.hasData) {
                    final subcategoriesData = snapshot.data!;
                    if (subcategoriesData.isEmpty) {
                      return const Text(noDataAvailableTxt);
                    }

                    List<Text> subcategoryWidget = [];

                    for (int i = 0; i < subcategoriesData.length; i++) {
                      final subcategory = subcategoriesData[i];
                      subcategoryWidget.add(Text("${i+1}. ${subcategory.subcategoryName}"));
                    }

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [...subcategoryWidget],
                      ),
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
