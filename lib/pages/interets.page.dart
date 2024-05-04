import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart';

class InterestCard extends StatelessWidget {
  final String interest;
  final IconData icon;

  InterestCard({required this.interest, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: InkWell(
        onTap: () {
          // Handle the tap action, maybe navigate to a detailed page or show a modal
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, size: 48.0),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(interest, style: TextStyle(fontSize: 18.0)),
            ),
          ],
        ),
      ),
    );
  }
}

class Interets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<InterestCard> interestCards = [
      InterestCard(interest: Provider.of<AppLanguage>(context).translate('Muscle Building'), icon: Icons.fitness_center),
      InterestCard(interest: Provider.of<AppLanguage>(context).translate('Camping'), icon: Icons.nature_people),
      InterestCard(interest: Provider.of<AppLanguage>(context).translate('Video Games'), icon: Icons.videogame_asset),
      InterestCard(interest: Provider.of<AppLanguage>(context).translate('Technology'), icon: Icons.computer),
      InterestCard(interest: Provider.of<AppLanguage>(context).translate('Music'), icon: Icons.music_note),
      InterestCard(interest: Provider.of<AppLanguage>(context).translate('Sport'), icon: Icons.sports_volleyball),
      // Add more InterestCards here if needed
    ];

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(Provider.of<AppLanguage>(context).translate('InteretsTitle')),
        backgroundColor: Colors.deepPurple,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Calculate the vertical padding dynamically
          double gridHeight = (interestCards.length / 2).ceil() * (200 + 16); // Assuming 2 columns
          double verticalPadding = max((constraints.maxHeight - gridHeight) / 2, 16.0);

          return GridView.extent(
            maxCrossAxisExtent: 200,
            padding: EdgeInsets.symmetric(vertical: verticalPadding, horizontal: 16),
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            children: interestCards,
          );
        },
      ),
    );
  }
}