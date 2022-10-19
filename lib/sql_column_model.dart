import 'package:sql_data_helper/dart_sql_data_helper.dart';

class SqlColumnModel {
  final String name;
  final SqlDataType type;
  final bool primaryKey;
  final bool autoIncrement;
  final bool unique;
  final bool notNull;

  SqlColumnModel(this.name,
      {required this.type,
      this.primaryKey = false,
      this.autoIncrement = false,
      this.unique = false,
      this.notNull = false});

  String get toCreate => [
        name,
        type.name.toUpperCase(),
        if (primaryKey) "PRIMARY KEY",
        if (autoIncrement) "AUTOINCREMENT",
        if (unique) "UNIQUE",
        if (notNull) "NOT NULL"
      ].join(" ");
}
