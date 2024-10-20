import 'package:flutter/material.dart';

import 'DetailPage.dart';

class DestinationCard extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String location;
  final double rating;
  final int numberOfPeople;

  const DestinationCard({
    Key? key,
    required this.imageUrl,
    required this.placeName,
    required this.location,
    required this.rating,
    required this.numberOfPeople,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220, // Make the card narrower for horizontal scrolling
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPage(
                placeName: placeName,
                location: location,
                imageUrl: imageUrl,
                rating: rating,
              ),
            ),
          );
        },
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  imageUrl,
                  height: 120,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      placeName,
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(location),
                    Row(
                      children: [
                        Icon(Icons.star, color: Colors.amber),
                        Text(rating.toString()),
                        Spacer(),
                        CircleAvatar(
                          child: Icon(Icons.person),
                        ),
                        SizedBox(width: 4),
                        Text("+$numberOfPeople")
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
