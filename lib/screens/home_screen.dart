import 'package:flutter/material.dart';
import 'package:studio_ghibli_api/screens/film_list_screen.dart';
import 'package:studio_ghibli_api/screens/people_list_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Studio Ghibli"),
        backgroundColor: Colors.lightBlueAccent,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PeopleListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('People'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FilmListScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Film'),
            ),
          ],
        ),
      ),
    );
  }
}
