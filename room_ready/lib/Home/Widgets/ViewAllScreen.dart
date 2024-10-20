import 'package:flutter/material.dart';

import 'DestinationCard.dart';

class ViewAllScreen extends StatelessWidget {
  final List<Map<String, dynamic>> destinations = [
    {
      'imageUrl': 'https://yourimageurl.com/cloudgate.jpg',
      'placeName': 'Cloud Gate "The Bean"',
      'location': 'Chicago, Illinois',
      'rating': 4.7,
      'numberOfPeople': 50
    },
    {
      'imageUrl': 'https://yourimageurl.com/artinstitute.jpg',
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
            numberOfPeople: destination['numberOfPeople'],
          );
        },
      ),
    );
  }
}
