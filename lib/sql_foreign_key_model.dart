library sql_data_helper;

import 'package:sql_data_helper/enums/sql_foreign_key_rules.dart';

class SqlForeignKeyModel {
  final String columnForeignKey;
  final String table;
  final String columnPrimaryKey;
  final SqlForeignKeyRules onUpdateRule;
  final SqlForeignKeyRules onDeleteRule;

  SqlForeignKeyModel(this.columnForeignKey,
      {required this.table,
      required this.columnPrimaryKey,
      this.onUpdateRule = SqlForeignKeyRules.noAction,
      this.onDeleteRule = SqlForeignKeyRules.noAction});

  String get toCreate => [
        "FOREIGN KEY ($columnForeignKey)",
        "REFERENCES $table ($columnPrimaryKey)",
        "ON UPDATE ${onUpdateRule.parameterText}",
        "ON DELETE ${onDeleteRule.parameterText}"
      ].join(" ");
}
