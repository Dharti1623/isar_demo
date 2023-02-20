import 'package:isar/isar.dart';
import 'category.dart';

part 'subcategory.g.dart';

@Collection()
class Subcategories{
  Id id = Isar.autoIncrement;
  late String subcategoryName;
  final categories = IsarLinks<Categories>();
}