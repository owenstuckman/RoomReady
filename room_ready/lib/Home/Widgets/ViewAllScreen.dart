import 'package:flutter/material.dart';

import 'DestinationCard.dart';

class ViewAllScreen extends StatelessWidget {
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
    // Add more destinations here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore Destinations'),
      ),
      body: ListView.builder(
        itemCount: destinations.length,
        itemBuilder: (context, index) {
          final destination = destinations[index];
          return DestinationCard(
            imageUrl: destination['imageUrl'],
            placeName: destination['placeName'],
            location: destination['location'],
            rating: destination['rating'],
          );
        },
      ),
    );
  }
}
