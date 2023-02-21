import 'package:categories/Data/Localization/Entities/category.dart';
import 'package:categories/Data/Localization/Entities/subcategory.dart';
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

  Future<void> insertCategory(Categories newCategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.categories.putSync(newCategory));
  }

  Future<void> updateCategory(int oldCategoryId, String newCategory) async {
    final isar = await db;
    final catData = await isar.categories.get(oldCategoryId);
    catData?.categoryName = newCategory;
    isar.writeTxnSync<int>(() => isar.categories.putSync(catData!));
  }

  Future<void> deleteCategory(int categoryId) async {
    final isar = await db;
    await isar.writeTxn(() async {
      /*final success = */ await isar.categories.delete(categoryId);
      // print('Recipe deleted: $success');
    });
  }

  Future<void> insertSubcategory(Subcategories newSubcategory) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.subcategories.putSync(newSubcategory));
  }

  Future<void> updateSubcategory(
      int oldSubcategoryId, String newSubcategory) async {
    final isar = await db;
    final subCatData = await isar.subcategories.get(oldSubcategoryId);
    subCatData?.subcategoryName = newSubcategory;
    isar.writeTxnSync<int>(() => isar.subcategories.putSync(subCatData!));
  }

  Future<void> deleteSubcategory(int subcategoryId) async {
    final isar = await db;
    await isar.writeTxn(() async {
      /*final success = */ await isar.subcategories.delete(subcategoryId);
      // print('Recipe deleted: $success');
    });
  }

  Future<List<Categories>> getAllCategories() async {
    final isar = await db;
    return await isar.categories.where().findAll();
  }

  Stream<List<Categories>> listenToCategories() async* {
    final isar = await db;
    yield* isar.categories.where().watch(fireImmediately: true);
  }

  Stream<List<Subcategories>>? listenToSubcategories() async* {
    final isar = await db;
    yield* isar.subcategories.where().watch(fireImmediately: true);
  }

  Future<List<Subcategories>> getSubcategoriesByCategory(
      Categories category) async {
    final isar = await db;
    return await isar.subcategories
        .filter()
        .categories((q) => q.idEqualTo(category.id))
        .findAll();
  }

  Future<List<Subcategories>> getSubCatData(Categories category) async {
    final isar = await db;
    var subCatData = await isar.subcategories
        .filter()
        .categories((q) => q.idEqualTo(category.id))
        .findAll();
    Stream<List<Subcategories>> queryChanged =
        isar.subcategories.where().watch(fireImmediately: true);
    queryChanged.listen((subCat) async {
      subCatData = await isar.subcategories
          .filter()
          .categories((q) => q.idEqualTo(category.id))
          .findAll();
    });
    return subCatData;
  }
}
