import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/character.dart';
import '../models/film.dart';

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

   Future<List<Film>> fetchFilms() async {
    final response = await http.get(Uri.parse('$baseUrl/films'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
     // final Map<String, dynamic> results = data['results'];
       return data.map((json) => Film.fromJson(json)).toList();
    } else {
      throw Exception('Falha ao carregar os filmes');
    }
  }
}
