import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart';
import 'Detail.page.dart';
class Projets_academiques extends StatefulWidget {
  @override
  _ProjetsAcademiquesState createState() => _ProjetsAcademiquesState();
}

class _ProjetsAcademiquesState extends State<Projets_academiques> {
  List<Map<String, String>> projets = [
    {
      'titreKey': 'hotelReservationManagementApp',
      'descriptionKey': 'hotelReservationManagementAppDescription',
      'date': 'Déc. 2023',
      'technologie': 'IIT',
      'localisationKey': 'iit',
      'imagePath': 'images/hotel.png'
    },
    {
      'titreKey': 'fastFoodOrderingApp',
      'descriptionKey': 'fastFoodOrderingAppDescription',
      'date': 'Nov – Déc. 2023',
      'technologie': 'IIT',
      'localisationKey': 'iit',
      'imagePath': 'images/commande.png'
    },
    {
      'titreKey': 'onlineSalesApp',
      'descriptionKey': 'onlineSalesAppDescription',
      'date': 'Mai. 2023',
      'technologieKey': 'iit',
      'localisationKey': 'iit',
      'imagePath': 'images/vente.png'
    },
    {
      'titreKey': 'carRentalApp',
      'descriptionKey': 'carRentalAppDescription',
      'date': 'Déc. 2021',
      'technologieKey': 'isims',
      'localisationKey': 'isims',
      'imagePath': 'images/location.png'
    },
  ];

  late List<Map<String, String>> filteredProjets;

  @override
  void initState() {
    super.initState();
    filteredProjets = projets;
  }

  void _filterProjets(String searchQuery) {
    List<Map<String, String>> _tempList = [];
    if (searchQuery.isNotEmpty) {
      _tempList.addAll(projets.where((projet) {
        var appLanguage = Provider.of<AppLanguage>(context, listen: false);
        return appLanguage.translate(projet['titreKey']!).toLowerCase().contains(searchQuery.toLowerCase()) ||
            projet['date']!.toLowerCase().contains(searchQuery.toLowerCase()) ||
            appLanguage.translate(projet['technologie']?? '').toLowerCase().contains(searchQuery.toLowerCase());
      }));
      setState(() {
        filteredProjets = _tempList;
      });
    } else {
      setState(() {
        filteredProjets = projets;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(appLanguage.translate('ProjetsAcademiquesTitle')),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: _filterProjets,
              decoration: InputDecoration(
                labelText: appLanguage.translate('SearchHint'),
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProjets.length,
              itemBuilder: (context, index) {
                var projet = filteredProjets[index];
                return Card(
                  margin: EdgeInsets.all(8),
                  elevation: 4,
                  child: ListTile(
                    leading: Image.asset(projet['imagePath']?? '', width: 56, height: 56),
                    title: Text(appLanguage.translate(projet['titreKey']?? '')),
                    //subtitle: Text(appLanguage.translate(projet['descriptionKey']?? '')),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            projet: {
                              'titre': appLanguage.translate(projet['titreKey'] ?? ''),
                              'description': appLanguage.translate(projet['descriptionKey'] ?? ''),
                              'date': projet['date'] ,
                              'localisation': appLanguage.translate(projet['localisationKey']! ),
                              'imagePath': projet['imagePath'] ,
                            },
                          ),
                        ),
                      );
                    },
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
