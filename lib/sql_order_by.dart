library sql_data_helper;

import 'package:sql_data_helper/enums/sql_where_order.dart';

class OrderBy {
  final String columnName;
  final WhereOrder order;

  OrderBy(this.columnName, {required this.order});

  String get getClauses {
    return "ORDER BY $columnName ${order.index}";
  }
}
