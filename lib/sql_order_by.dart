part of 'package:sql_data_helper/main.dart';

class OrderBy {
  final String columnName;
  final WhereOrder order;

  OrderBy(this.columnName, {required this.order});

  String get getClauses {
    return "ORDER BY $columnName ${order.index}";
  }
}
