// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:studio_ghibli_api/screens/film_details.dart';
import 'package:studio_ghibli_api/services/st_api_service.dart';
import '../models/film.dart';

class FilmListScreen extends StatefulWidget {
  const FilmListScreen({Key? key}) : super(key: key);

  @override
  FilmListScreenState createState() => FilmListScreenState();
}

class FilmListScreenState extends State<FilmListScreen> {
  late Future<List<Film>> _futureFilms;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureFilms = _apiService.fetchFilms() as Future<List<Film>>;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Studio Ghibli'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<Film>>(
            future: _futureFilms,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final films = snapshot.data!;
                return ListView.builder(
                  itemCount: films.length,
                  itemBuilder: (context, index) {
                    final film = films[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: film.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        title: Text(film.title),
                        subtitle: Text('Director: ${film.director}'),
                        onTap: () {    
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => FilmDetailsScreen(film)
                            ),
                          );
                        },
                      ),
                    );
                  },
                );
              }
              return const Center(child: Text('Nenhum dado disponível'));
            },
          ),
        ));
  }
}
