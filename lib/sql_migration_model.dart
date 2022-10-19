class SqlMigrationModel {
  final int version;
  final List<String> commands;

  SqlMigrationModel(this.version, {required this.commands});
}
