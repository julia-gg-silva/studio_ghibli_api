import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const StudioGhibliApp());
}

class StudioGhibliApp extends StatelessWidget {
  const StudioGhibliApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Studio Ghibli',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
