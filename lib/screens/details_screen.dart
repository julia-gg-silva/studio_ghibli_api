import 'package:flutter/material.dart';
import 'package:studio_ghibli_api/models/character.dart';

class DetailsScreen extends StatefulWidget {
  
  const DetailsScreen(this.character,{super.key});
  final Character character;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {

    final character = widget.character;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details Character",
            style: TextStyle(fontWeight: FontWeight.w700, fontSize: 25)),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 100),
          Text(character.name,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23)),
          const SizedBox(height: 25),
          Image.network(
            character.image ?? "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwbYMnoBKydOk2tezl6c1A1g1nQgC_8JXckA&s",
            width: 300,
            height: 300,
            fit: BoxFit.cover,
          ),
           const SizedBox(height: 10),
          Text('Age: ${character.age}'),
           const SizedBox(height: 8),
          Text('Gender: ${character.gender}'),
           const SizedBox(height: 8),
          Text('Hair color: ${character.hairColor}'),
           const SizedBox(height: 8),
          Text('Eye color: ${character.eyeColor}'),
           const SizedBox(height: 8),
        ],
      )),
    );
  }
}