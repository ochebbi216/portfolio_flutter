import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';

import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart';

// Assurez-vous que MyDrawer est accessible

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset(
      'video/cv3.mp4', // Remplacez par le chemin de votre fichier vidéo dans les assets
    )..initialize().then((_) {
      setState(() {});
      _controller.play(); // Lancer la vidéo automatiquement
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(), // Utilisez votre Drawer personnalisé
      appBar: AppBar(
        title: Text('Home'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // Video player
          _controller.value.isInitialized
              ? AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          )
              : Container(
            color: Colors.black,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          ),
          SizedBox(height: 20), // Laissez un espace après la vidéo
          // Sections UI in a grid layout
          Expanded(
            child: _buildSectionsGrid(context),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionsGrid(BuildContext context) {
    List<Map> sections = [
      {'title': Provider.of<AppLanguage>(context).translate('InformationsPersonnellesTitle'), 'route': '/informations_personnells', 'icon': Icons.person},
      {'title': Provider.of<AppLanguage>(context).translate('CompetencesTitle'), 'route': '/competences', 'icon': Icons.star},
      {'title': Provider.of<AppLanguage>(context).translate('FormationAcademiqueTitle'),'route':'/formation_academique', 'icon': Icons.school},
      {'title': Provider.of<AppLanguage>(context).translate('ExperiencesProfessionnellesTitle'), 'route':'/experience_professionnelles','icon': Icons.work},
      {'title': Provider.of<AppLanguage>(context).translate('ProjetsAcademiquesTitle'), 'route': '/projets_academiques', 'icon': Icons.lightbulb_outline},
      {'title': Provider.of<AppLanguage>(context).translate('CertificationsTitle'), 'route': '/certifications', 'icon': Icons.card_membership},
      {'title': Provider.of<AppLanguage>(context).translate('LanguesTitle'), 'route': '/langues', 'icon': Icons.language},
      {'title': Provider.of<AppLanguage>(context).translate('InteretsTitle'), 'route': '/interets', 'icon': Icons.favorite},
      {'title': Provider.of<AppLanguage>(context).translate('CodeQRTitle'), 'route': '/codeQR', 'icon': Icons.qr_code_scanner},

    ];

    // Determine the number of columns for the grid based on screen orientation and size
    int crossAxisCount = MediaQuery.of(context).orientation == Orientation.portrait ? 2 : 3;
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth / crossAxisCount;
    double cardHeight = cardWidth * 0.8; // 80% of card width to maintain aspect ratio

    return GridView.builder(
      padding: EdgeInsets.all(8.0), // Padding for the entire grid
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: cardWidth / cardHeight, // Adjust the aspect ratio of the grid items
        crossAxisSpacing: 8.0, // Space between columns
        mainAxisSpacing: 8.0, // Space between rows
      ),
      itemCount: sections.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(context, sections[index]['route']);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Icon(sections[index]['icon'], size: 48, color: Theme.of(context).colorScheme.secondary),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    sections[index]['title'],
                    style: TextStyle(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}