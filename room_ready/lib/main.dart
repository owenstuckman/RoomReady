import 'package:flutter/material.dart';
import 'package:room_ready/home_page.dart';
import 'package:room_ready/into_page.dart';
import 'package:room_ready/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bonvoyage',
        theme: Themes.themeData['Red'],
        builder: (context, snapshot) {
          return HomePage();

    }
    );
  }
}