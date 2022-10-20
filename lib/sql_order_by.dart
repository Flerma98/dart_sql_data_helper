import 'package:sql_data_helper/enums/sql_where_order.dart';

class OrderBy {
  final String columnName;
  final WhereOrder order;

  OrderBy(this.columnName, {required this.order});

  String getClauses({final bool withText = false}) {
    return "${(withText) ? "ORDER BY" : ""} $columnName ${order.name}";
  }
}
