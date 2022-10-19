import 'package:sql_data_helper/dart_sql_data_helper.dart';

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
