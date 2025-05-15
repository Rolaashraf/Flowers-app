import 'dart:convert';
import 'dart:html';

import 'package:tree/quote/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote() async {
  final response = await http.get(
    Uri.parse("https://api.api-ninjas.com/v1/quotes"),
    headers: {'X-Api-Key': 'AFn4OhMwRdAkT3h9zTjMfQ==NQ9RYJlfVO5QAVM0'},
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);

    return data.map((json) => Quote.fromJson(json)).toList();
  }

  throw Exception("Failed to load data");
}
