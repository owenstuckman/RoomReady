import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:room_ready/Itinerary/Calender.dart';
import 'package:room_ready/Itinerary/Itinerary.dart';
import 'package:room_ready/Itinerary/budgetSelection.dart';
import 'package:room_ready/Itinerary/toBring.dart';
import 'package:room_ready/Itinerary/yearPicker.dart';
import 'package:room_ready/MainConversation/messages.dart';
import 'package:room_ready/Startup/Sign_up.dart';
import 'package:room_ready/Startup/languages.dart';
import 'package:room_ready/home_page.dart';
import 'package:room_ready/Startup/Sign_in.dart';
import 'package:room_ready/Startup/loading_page.dart';
import 'package:room_ready/themes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'MainConversation/conversation_helpers/conversations.dart';

Future<void> main() async {
  await Supabase.initialize(
    url: 'https://tsewlrukrykkycootlsb.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRzZXdscnVrcnlra3ljb290bHNiIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MjkzNjcwNTUsImV4cCI6MjA0NDk0MzA1NX0.DNwdRirUSViojOqOOLHaJ_lW9u2jd1siOxqdmQWz6PU',
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Conversations()),
      ],
      child: MyApp(),
    ),
  );
}

// Get a reference your Supabase client
final supabase = Supabase.instance.client;


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
        theme: Themes.themeData['Lavender'],
        builder: (context, snapshot) {
          return HomePage();

    }
    );
  }
}