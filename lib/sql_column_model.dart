import 'package:sql_data_helper/enums/sql_data_type.dart';

class SqlColumnModel {
  final String name;
  final SqlDataType type;
  final bool primaryKey;
  final bool autoIncrement;
  final bool unique;
  final bool notNull;
  final Object? defaultValue;

  SqlColumnModel(this.name,
      {required this.type,
      this.primaryKey = false,
      this.autoIncrement = false,
      this.unique = false,
      this.notNull = false,
      this.defaultValue});

  String get toCreate => [
        name,
        type.name.toUpperCase(),
        if (primaryKey) "PRIMARY KEY",
        if (autoIncrement) "AUTOINCREMENT",
        if (unique) "UNIQUE",
        if (notNull) "NOT NULL",
        if (!notNull) "DEFAULT $getCorrectDefaultValue"
      ].join(" ");

  String get getCorrectDefaultValue {
    if (defaultValue == null) return "NULL";
    if (defaultValue is String) return "'$defaultValue'";
    return "$defaultValue";
  }
}
