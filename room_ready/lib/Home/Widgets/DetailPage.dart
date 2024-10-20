import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String imageUrl;
  final String placeName;
  final String location;
  final double rating;

  const DetailPage({
    Key? key,
    required this.imageUrl,
    required this.placeName,
    required this.location,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(placeName),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(imageUrl),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeName,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(location),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.amber),
                      Text(rating.toString(), style: TextStyle(fontSize: 18)),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Description about the place can go here...',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
