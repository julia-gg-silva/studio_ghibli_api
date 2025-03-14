import 'package:flutter/material.dart';
import 'package:studio_ghibli_api/models/film.dart';

class FilmDetailsScreen extends StatefulWidget {
  const FilmDetailsScreen(this.film, {super.key});
  final Film film;

  @override
  State<FilmDetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<FilmDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final film = widget.film;
    return Scaffold(
      appBar: AppBar(
        title: Text(film.title,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 100),
              Text(film.originalTitle,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23)),
              const SizedBox(height: 25),
              Image.network(
                film.image,
                width: 300,
                height: 300,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Description: ${film.description}'),
              ),
              const SizedBox(height: 8),
              Text('Director: ${film.director}'),
              const SizedBox(height: 8),
              Text('Producer: ${film.producer}'),
              const SizedBox(height: 8),
              Text('Release date: ${film.releaseDate}'),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
