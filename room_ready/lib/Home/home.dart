import 'package:flutter/material.dart';

import 'Widgets/DestinationCard.dart';
import 'Widgets/ViewAllScreen.dart';

/*
  Serves currently as sample page
 */

class Home extends StatelessWidget {

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
                children: destinations.map((destination) {
                  return DestinationCard(
                    imageUrl: destination['imageUrl'],
                    placeName: destination['placeName'],
                    location: destination['location'],
                    rating: destination['rating'],
                    numberOfPeople: destination['numberOfPeople'],
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

