import 'package:sql_data_helper/enums/sql_where_union.dart';

class SqlWhere {
  final List<String> clauses;
  final List<dynamic> clausesValues;
  final WhereUnion whereUnion;

  SqlWhere(this.clauses,
      {required this.clausesValues, this.whereUnion = WhereUnion.and});

  String getClauses({final bool withText = false}) {
    for (var i = 0; i < clauses.length; i++) {
      if (clauses[i].contains("()")) {
        clauses[i] = clauses[i].replaceAll("()", "(NULL)");
      }
    }

    if (clauses.isEmpty) return "";

    return [if (withText) " WHERE ", clauses.join(" ${whereUnion.name} ")]
        .join(" ");
  }
}
