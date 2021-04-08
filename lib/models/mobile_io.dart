import 'dart:io';
import 'dart:convert';
import 'package:csv/csv.dart';


Future<List<List>> getCsvAsList(String path) async {
  final input = new File(path).openRead();
  final fields = await input
      .transform(utf8.decoder)
      .transform(new CsvToListConverter(eol: "\n"))
      .toList();
  return fields;
}
void main() async {
  var fields = await getCsvAsList("lib/data/1.csv");
  print(fields);
}
