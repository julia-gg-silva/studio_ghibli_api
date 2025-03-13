// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:studio_ghibli_api/screens/details_screen.dart';
import 'package:studio_ghibli_api/services/st_api_service.dart';
import '../models/character.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Character>> _futureCharacters;
  final ApiService _apiService = ApiService();

  @override
  void initState() {
    super.initState();
    _futureCharacters = _apiService.fetchCharacters();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Studio Ghibli'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<List<Character>>(
            future: _futureCharacters,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Erro: ${snapshot.error}'));
              } else if (snapshot.hasData) {
                final characters = snapshot.data!;
                return ListView.builder(
                  itemCount: characters.length,
                  itemBuilder: (context, index) {
                    final character = characters[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                      child: ListTile(
                        leading: CachedNetworkImage(
                          imageUrl: character.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwbYMnoBKydOk2tezl6c1A1g1nQgC_8JXckA&s",
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                        title: Text(character.name),
                        subtitle: Text('Age: ${character.age}'),
                        onTap: () {    
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => DetailsScreen(character)
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
