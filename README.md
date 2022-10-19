# sql_data_helper

[![pub package](https://img.shields.io/pub/v/sql_data_helper.svg)](https://pub.dev/packages/sql_data_helper)

A Dart package to organize our database data.

## Getting Started

### Installing

In your Flutter project, add the package to your dependencies

`flutter pub add sql_data_helper`

or

```yml
dependencies:
  ...
  sql_data_helper: #last_version
  ...
```

## Usage Example

### Create a field

```dart

SqlColumnModel idField = SqlColumnModel("field_name",
    type: SqlDataType.integer, primaryKey: true, autoIncrement: true);
```

### Create a foreign key

```dart

SqlForeignKeyModel fkField = SqlForeignKeyModel(
    "field",
    table: "table_name",
    columnPrimaryKey: "pk_of_table",
    onUpdateRule: SqlForeignKeyRules.cascade,
    onDeleteRule: SqlForeignKeyRules.cascade);
```

### Example of how to organize a table

```dart
abstract class SqlTableRestaurant {
  static const String tableName = "restaurants";

  static final SqlColumnModel id = SqlColumnModel("id",
      type: SqlDataType.integer, primaryKey: true, autoIncrement: true);

  static final SqlColumnModel name = SqlColumnModel("name", type: SqlDataType.text, notNull: true);

  String get toCreate => "CREATE TABLE IF NOT EXISTS $tableName (${[
    id.toCreate,
    name.toCreate
  ].join(" ")})";
}
```

### With foreign key
```dart
abstract class SqlTableFood {
  static const String tableName = "foods";

  static final SqlColumnModel id = SqlColumnModel("id",
      type: SqlDataType.integer, primaryKey: true, autoIncrement: true);

  static final SqlColumnModel restaurantId = SqlColumnModel("restaurant_id",
      type: SqlDataType.integer, notNull: true);

  static final SqlColumnModel name =
  SqlColumnModel("name", type: SqlDataType.text);

  static final SqlForeignKeyModel _restaurantFk = SqlForeignKeyModel(
      restaurantId.name,
      table: SqlTableRestaurant.tableName,
      columnPrimaryKey: SqlTableRestaurant.id.name,
      onUpdateRule: SqlForeignKeyRules.cascade,
      onDeleteRule: SqlForeignKeyRules.cascade);

  String get toCreate => "CREATE TABLE IF NOT EXISTS $tableName (${[
    id.toCreate,
    restaurantId.toCreate,
    name.toCreate,
    _restaurantFk.toCreate
  ].join(" ")})";
}
```