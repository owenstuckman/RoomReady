import 'package:flutter/material.dart';

import 'Widgets/DestinationCard.dart';
import 'Widgets/ViewAllScreen.dart';

/*
  Serves currently as sample page
 */

class Home extends StatelessWidget {


  // sample data
  final List<Map<String, dynamic>> destinations = [
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE10sKP_U86cMZgQkQ2GBMcr_Jk8Glq4ylpQ&s',
      'placeName': 'Cloud Gate "The Bean"',
      'location': 'Chicago, Illinois',
      'rating': 4.7,
      'numberOfPeople': 50
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE10sKP_U86cMZgQkQ2GBMcr_Jk8Glq4ylpQ&s',
      'placeName': 'The Art Institute of Chicago',
      'location': 'Chicago, Illinois',
      'rating': 4.8,
      'numberOfPeople': 30
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE10sKP_U86cMZgQkQ2GBMcr_Jk8Glq4ylpQ&s',
      'placeName': 'The Art Institute of Chicago',
      'location': 'Chicago, Illinois',
      'rating': 4.8,
      'numberOfPeople': 30
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE10sKP_U86cMZgQkQ2GBMcr_Jk8Glq4ylpQ&s',
      'placeName': 'The Art Institute of Chicago',
      'location': 'Chicago, Illinois',
      'rating': 4.8,
      'numberOfPeople': 30
    },
    {
      'imageUrl': 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQE10sKP_U86cMZgQkQ2GBMcr_Jk8Glq4ylpQ&s',
      'placeName': 'The Art Institute of Chicago',
      'location': 'Chicago, Illinois',
      'rating': 4.8,
      'numberOfPeople': 30
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore with Marriott'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ViewAllScreen()),
              );
            },
            child: Text('View All', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Best Destinations',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            height: 250, // Set the height for horizontal scrolling content
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                // call sample data
                children: destinations.map((destination) {
                  return DestinationCard(
                    imageUrl: destination['imageUrl'],
                    placeName: destination['placeName'],
                    location: destination['location'],
                    rating: destination['rating'],
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

