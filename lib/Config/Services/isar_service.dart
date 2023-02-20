import 'package:categories/Data/Localization/Entities/subcategory.dart';
import 'package:categories/Data/Localization/Entities/category.dart';
import 'package:isar/isar.dart';

class IsarService {
  late Future<Isar> db;

  IsarService() {
    db = openDB();
  }

  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      return await Isar.open(
        [CategoriesSchema, SubcategoriesSchema],
        inspector: true,
      );
    }
    return Future.value(Isar.getInstance());
  }

  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }

  Future<void> saveCategory(Categories newCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categories.putSync(newCategory));
  }

  Future<void> editCategory(Categories newCategory,Categories oldCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categories.putSync(newCategory));
  }

  Future<void> saveSubcategory(Subcategories newSubcategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.subcategories.putSync(newSubcategory));
  }

  Future<List<Categories>> getAllCategories() async {
    final isar = await db;
    return await isar.categories.where().findAll();
  }

  Stream<List<Categories>> listenToCategories() async* {
    final isar = await db;
    yield* isar.categories.where().watch(fireImmediately: true);
  }

  Future<List<Subcategories>> getSubcategoriesByCategory(Categories category) async {
    final isar = await db;
    return await isar.subcategories
        .filter()
        .categories((q) => q.idEqualTo(category.id))
        .findAll();
  }



}
