import 'package:isar/isar.dart';
import '../Entities/subcategory.dart';

part 'category.g.dart';

@Collection()
class Categories{
  Id id = Isar.autoIncrement;
  late String categoryName;
  @Backlink(to: "categories")
  final subcategories = IsarLinks<Subcategories>();
}
