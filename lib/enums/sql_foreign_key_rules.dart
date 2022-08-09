library sql_data_helper;

enum SqlForeignKeyRules { noAction, restrict, setNull, setDefault, cascade }

extension SqlForeignKeyRulesExtension on SqlForeignKeyRules {
  String get parameterText {
    switch (this) {
      case SqlForeignKeyRules.noAction:
        return "NO ACTION";
      case SqlForeignKeyRules.restrict:
        return "RESTRICT";
      case SqlForeignKeyRules.setNull:
        return "SET NULL";
      case SqlForeignKeyRules.setDefault:
        return "SET DEFAULT";
      case SqlForeignKeyRules.cascade:
        return "CASCADE";
    }
  }
}
