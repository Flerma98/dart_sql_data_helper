import 'package:sql_data_helper/dart_sql_data_helper.dart';

class OrderBy {
  final String columnName;
  final WhereOrder order;

  OrderBy(this.columnName, {required this.order});

  String get getClauses {
    return "ORDER BY $columnName ${order.index}";
  }
}
