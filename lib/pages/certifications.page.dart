import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart';

class Certification extends StatelessWidget {
  final List<Map<String, dynamic>> certifications = [
    {
      'title': 'Java',
      'year': '2020',
      'image': 'images/java_certification.jpg', // Replace with your asset path
    },
    {
      'title': 'Scrum Fundamentals',
      'year': '2023',
      'image': 'images/scrum_certification.png', // Replace with your asset path
    },
    {
      'title': 'Business Intelligence',
      'year': '2021',
      'image': 'images/bi_certification.jpg', // Replace with your asset path
    },
    {
      'title': 'Devops',
      'year': '2021',
      'image': 'images/devops_certification.jpg', // Replace with your asset path
    },
    {
      'title': 'Big Data',
      'year': '2021',
      'image': 'images/bigdata_certification.jpg', // Replace with your asset path
    },
    {
      'title': 'Azure WebApps',
      'year': '2021',
      'image': 'images/azure_certification.jpg', // Replace with your asset path
    },
  ];
  void _showImageDialog(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(10), // Padding around the dialog
          child: InteractiveViewer(
            panEnabled: false, // Disable panning if you want to open it in full width
            minScale: 0.1, // Minimum zoom scale
            maxScale: 4.0, // Maximum zoom scale
            child: Image.asset(imagePath),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(Provider.of<AppLanguage>(context).translate('CertificationsTitle')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0), // Adjust the overall padding for the grid
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 4.0,
            mainAxisSpacing: 4.0,
            childAspectRatio: (1 / 1.2), // Adjust the child aspect ratio if needed
          ),
          itemCount: certifications.length,
          itemBuilder: (context, index) {
            return GridTile(
              footer: GridTileBar(
                backgroundColor: Colors.black54,
                title: Text(
                  certifications[index]['title'],
                  style: TextStyle(fontSize: 16), // Smaller font size for titles
                ),
                subtitle: Text(
                  '${certifications[index]['year']}',
                  style: TextStyle(fontSize: 12), // Smaller font size for subtitles
                ),
              ),
              child: GestureDetector(
                onTap: () => _showImageDialog(context, certifications[index]['image']),
                child: Container(
                  padding: EdgeInsets.all(8), // Adjust the padding around the image
                  child: Image.asset(
                    certifications[index]['image'],
                    fit: BoxFit.contain, // Ensures the entire image is visible within the tile.
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

