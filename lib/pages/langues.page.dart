import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart';

class Langues extends StatelessWidget {
  final List<Map<String, dynamic>> langues = [
    {
      'nom':'Arabe',
      'niveau': 'Native',
      'pourcentage': 1.0, // 100%
      'icon': Icons.language, // Exemple d'icône
    },
    {
      'nom': 'Français',
      'niveau': 'Intermediate',
      'pourcentage': 0.7, // 70%
      'icon': Icons.translate, // Exemple d'icône
    },
    {
      'nom': 'Anglais',
      'niveau': 'Advanced',
      'pourcentage': 0.8, // 80%
      'icon': Icons.public, // Exemple d'icône
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(Provider.of<AppLanguage>(context).translate('LanguesTitle')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: langues.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4.0,
                  margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      // You might want to put a country flag or similar here
                      child: Icon(langues[index]['icon']),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    title: Text(
                      Provider.of<AppLanguage>(context).translate(langues[index]['nom']),
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(Provider.of<AppLanguage>(context).translate(langues[index]['niveau'])),
                    trailing: Container(
                      width: 60,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CircularProgressIndicator(
                            value: langues[index]['pourcentage'],
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                            strokeWidth: 5,
                          ),
                          Text(
                            '${(langues[index]['pourcentage'] * 100).toInt()}%',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}