// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetSubcategoriesCollection on Isar {
  IsarCollection<Subcategories> get subcategories => this.collection();
}

const SubcategoriesSchema = CollectionSchema(
  name: r'Subcategories',
  id: -26382946961491815,
  properties: {
    r'subcategoryName': PropertySchema(
      id: 0,
      name: r'subcategoryName',
      type: IsarType.string,
    )
  },
  estimateSize: _subcategoriesEstimateSize,
  serialize: _subcategoriesSerialize,
  deserialize: _subcategoriesDeserialize,
  deserializeProp: _subcategoriesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'categories': LinkSchema(
      id: 4404902082730398679,
      name: r'categories',
      target: r'Categories',
      single: false,
    )
  },
  embeddedSchemas: {},
  getId: _subcategoriesGetId,
  getLinks: _subcategoriesGetLinks,
  attach: _subcategoriesAttach,
  version: '3.0.5',
);

int _subcategoriesEstimateSize(
  Subcategories object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.subcategoryName.length * 3;
  return bytesCount;
}

void _subcategoriesSerialize(
  Subcategories object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.subcategoryName);
}

Subcategories _subcategoriesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Subcategories();
  object.id = id;
  object.subcategoryName = reader.readString(offsets[0]);
  return object;
}

P _subcategoriesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _subcategoriesGetId(Subcategories object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _subcategoriesGetLinks(Subcategories object) {
  return [object.categories];
}

void _subcategoriesAttach(
    IsarCollection<dynamic> col, Id id, Subcategories object) {
  object.id = id;
  object.categories
      .attach(col, col.isar.collection<Categories>(), r'categories', id);
}

extension SubcategoriesQueryWhereSort
    on QueryBuilder<Subcategories, Subcategories, QWhere> {
  QueryBuilder<Subcategories, Subcategories, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SubcategoriesQueryWhere
    on QueryBuilder<Subcategories, Subcategories, QWhereClause> {
  QueryBuilder<Subcategories, Subcategories, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SubcategoriesQueryFilter
    on QueryBuilder<Subcategories, Subcategories, QFilterCondition> {
  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subcategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'subcategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'subcategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'subcategoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'subcategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'subcategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'subcategoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'subcategoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'subcategoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      subcategoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'subcategoryName',
        value: '',
      ));
    });
  }
}

extension SubcategoriesQueryObject
    on QueryBuilder<Subcategories, Subcategories, QFilterCondition> {}

extension SubcategoriesQueryLinks
    on QueryBuilder<Subcategories, Subcategories, QFilterCondition> {
  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition> categories(
      FilterQuery<Categories> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'categories');
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      categoriesLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', length, true, length, true);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      categoriesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, true, 0, true);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      categoriesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, false, 999999, true);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      categoriesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', 0, true, length, include);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      categoriesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'categories', length, include, 999999, true);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterFilterCondition>
      categoriesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(
          r'categories', lower, includeLower, upper, includeUpper);
    });
  }
}

extension SubcategoriesQuerySortBy
    on QueryBuilder<Subcategories, Subcategories, QSortBy> {
  QueryBuilder<Subcategories, Subcategories, QAfterSortBy>
      sortBySubcategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subcategoryName', Sort.asc);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterSortBy>
      sortBySubcategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subcategoryName', Sort.desc);
    });
  }
}

extension SubcategoriesQuerySortThenBy
    on QueryBuilder<Subcategories, Subcategories, QSortThenBy> {
  QueryBuilder<Subcategories, Subcategories, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterSortBy>
      thenBySubcategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subcategoryName', Sort.asc);
    });
  }

  QueryBuilder<Subcategories, Subcategories, QAfterSortBy>
      thenBySubcategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'subcategoryName', Sort.desc);
    });
  }
}

extension SubcategoriesQueryWhereDistinct
    on QueryBuilder<Subcategories, Subcategories, QDistinct> {
  QueryBuilder<Subcategories, Subcategories, QDistinct>
      distinctBySubcategoryName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'subcategoryName',
          caseSensitive: caseSensitive);
    });
  }
}

extension SubcategoriesQueryProperty
    on QueryBuilder<Subcategories, Subcategories, QQueryProperty> {
  QueryBuilder<Subcategories, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Subcategories, String, QQueryOperations>
      subcategoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'subcategoryName');
    });
  }
}
