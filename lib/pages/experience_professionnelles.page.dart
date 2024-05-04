import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart'; // Ensure this path is correct
import '../menu/drawer.widget.dart'; // Make sure this import path is correct

class ExperienceProfessionnelles extends StatelessWidget {
  ExperienceProfessionnelles({Key? key}) : super(key: key);

  final List<Map<String, dynamic>> experiences = [
    {
      'titleKey': 'DataClassificationExtractionTitle',
      'subtitleKey': 'DataClassificationExtractionSubtitle',
      'duration': 'Août – Sep. 2022',
      'location': 'Djagora',
      'icon': Icons.computer,
    },
    {
      'titleKey': 'IOTPlatformProjectTitle',
      'subtitleKey': 'IOTPlatformProjectSubtitle',
      'duration': 'Fév – Mai. 2022',
      'location': 'IT Services',
      'icon': Icons.eco,
    },
    {
      'titleKey': 'BusinessAnalyticsPowerBITitle',
      'subtitleKey': 'BusinessAnalyticsPowerBISubtitle',
      'duration': 'Juil – Août. 2021',
      'location': 'Primatec Engineering',
      'icon': Icons.bar_chart,
    },
    // Add more experiences as needed...
  ];

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context);
    ThemeData theme = Theme.of(context);

    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text(appLanguage.translate('ExperienceProfessionnellesTitle')),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        itemCount: experiences.length,
        itemBuilder: (context, index) {
          return buildExperienceTile(context, experiences[index], appLanguage);
        },
      ),
    );
  }

  Widget buildExperienceTile(BuildContext context, Map<String, dynamic> experience, AppLanguage appLanguage) {
    ThemeData theme = Theme.of(context);

    return Card(
      margin: EdgeInsets.all(8.0),
      child: ExpansionTile(
        leading: Icon(
          experience['icon'],
          size: 36.0,
          color: theme.colorScheme.secondary,
        ),
        title: Text(
          appLanguage.translate(experience['titleKey']),
          style: TextStyle(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        subtitle: Text(
          appLanguage.translate(experience['subtitleKey']),
          textAlign: TextAlign.center,
        ),
        children: <Widget>[
          Divider(color: theme.dividerColor),
          ListTile(
            leading: Icon(Icons.calendar_today, size: 20.0, color: theme.iconTheme.color),
            title: Text(
              '${appLanguage.translate('Duration')} ${experience['duration']}',
              style: TextStyle(color: theme.textTheme.bodyLarge?.color),
            ),
          ),
          ListTile(
            leading: Icon(Icons.location_on, size: 20.0, color: theme.iconTheme.color),
            title: Text(
              '${appLanguage.translate('Location')} ${experience['location']}',
              style: TextStyle(color: theme.textTheme.bodyLarge?.color),
            ),
          ),
        ],
      ),
    );
  }
}
