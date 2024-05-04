import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> projet;

  DetailPage({Key? key, required this.projet}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String titre = projet['titre'] ?? 'Unknown Title';
    final String description = projet['description'] ?? 'Unknown Description';
    final String date = projet['date'] ?? 'Unknown Date';
    final String localisation = projet['localisation'] ?? 'Unknown Location';

    if ([titre, description, date, localisation].contains('Unknown')) {
      debugPrint('Warning: Using default values for DetailPage');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(titre),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView( // Makes the page scrollable
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              projet['imagePath'] ?? 'path/to/default/image.png',
              width: MediaQuery.of(context).size.width,
              height: 250,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                titre,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Aligns the icon with the top of the text
                children: <Widget>[
                  Icon(Icons.calendar_today, color: Colors.deepPurple),
                  SizedBox(width: 10),
                  Expanded( // Allows the text to wrap and fill the available horizontal space
                    child: Text(
                      date,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.place, color: Colors.deepPurple),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      localisation,
                      style: TextStyle(fontSize: 16),
                    ),
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
