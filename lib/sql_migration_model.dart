part of 'package:sql_data_helper/main.dart';

class SqlMigrationModel {
  final int version;
  final List<String> commands;

  SqlMigrationModel(this.version, {required this.commands});
}
