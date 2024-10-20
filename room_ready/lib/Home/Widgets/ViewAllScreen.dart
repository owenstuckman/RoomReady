import 'package:flutter/material.dart';

import 'DestinationCard.dart';

class ViewAllScreen extends StatelessWidget {
  final List<Map<String, dynamic>> destinations = [
    {
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/en/thumb/c/c1/Cloud_Gate_%28The_Bean%29_from_east%27.jpg/340px-Cloud_Gate_%28The_Bean%29_from_east%27.jpg',
      'placeName': 'Cloud Gate "The Bean"',
      'location': 'Chicago, Illinois',
      'rating': 4.7,
      'numberOfPeople': 50
    },


    {
      'imageUrl': 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f8/Art_Institute_of_Chicago_%2851575570710%29.jpg/250px-Art_Institute_of_Chicago_%2851575570710%29.jpg',
      'placeName': 'The Art Institute of Chicago',
      'location': 'Chicago, Illinois',
      'rating': 4.8,
      'numberOfPeople': 30
    },
    {
      'imageUrl': 'https://media.istockphoto.com/id/1467962890/photo/above-chicago.jpg?s=612x612&w=0&k=20&c=lZJbZiT10L_9-mjS07rEwCOT6wUigyUdKYJxrEbeuvY=',
      'placeName': 'Millennium Park',
      'location': 'Chicago, Illinois',
      'rating': 4.8,
      'numberOfPeople': 100
    },
    {
      'imageUrl': 'https://cdn.choosechicago.com/uploads/2019/05/RP_NAVY-PIER5-e1565721679625-2400x1166.jpg',
      'placeName': 'Navy Pier',
      'location': 'Chicago, Illinois',
      'rating': 4.6,
      'numberOfPeople': 75
    },
    {
      'imageUrl': 'https://mccollege.edu/wp-content/uploads/2023/09/mike-balbus-Yfxydjld_20-unsplash-scaled.jpg',
      'placeName': 'Willis Tower',
      'location': 'Chicago, Illinois',
      'rating': 4.5,
      'numberOfPeople': 60
    },
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
