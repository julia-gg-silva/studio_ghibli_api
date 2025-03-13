import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';

class ApiService {
  static const String baseUrl = 'https://ghibliapi.vercel.app';

  Future<List<Character>> fetchCharacters() async {
    final response = await http.get(Uri.parse('$baseUrl/people'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
     // final Map<String, dynamic> results = data['results'];
       return data.map((json) => Character.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os personagens');
    }
  }
}
