import 'package:sql_data_helper/enums/sql_where_union.dart';

class SqlWhere {
  final List<String> clauses;
  final WhereUnion whereUnion;

  SqlWhere(this.clauses, {this.whereUnion = WhereUnion.and});

  String get getClauses {
    for (var i = 0; i < clauses.length; i++) {
      if (clauses[i].contains("()")) {
        clauses[i] = clauses[i].replaceAll("()", "(NULL)");
      }
    }

    return [
      if (clauses.isNotEmpty) " WHERE ",
      clauses.join(" ${whereUnion.name} ")
    ].join(" ");
  }
}
