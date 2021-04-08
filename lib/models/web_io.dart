import 'dart:html';
import 'package:csv/csv.dart';

Future<List<List>> getCsvAsList(String path) async {
  final str = await HttpRequest.getString(path);
  final fields = const CsvToListConverter(eol: "\n").convert(str)
      .toList();
  return fields;
}

void main() async {
  var fields = await getCsvAsList("lib/data/1.csv");
  print(fields);
}
