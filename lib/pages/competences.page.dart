
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart'; // Ensure this path is correct for your project structure

class Competences extends StatelessWidget {
  final AppLanguage appLanguage = AppLanguage();

  @override
  Widget build(BuildContext context) {
    // Accessing theme data for consistent styling
    ThemeData theme = Theme.of(context);

    return Scaffold(
      drawer:  MyDrawer(),
      appBar: AppBar(
        title:  Text(Provider.of<AppLanguage>(context).translate('CompetencesTitle')),
        // AppBar color now uses the theme's primary color
        //backgroundColor: theme.primaryColor,
        backgroundColor: Colors.deepPurple,

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // The color arguments now use theme colors
            buildCompetenceSectionWithIcon(Provider.of<AppLanguage>(context).translate('cf'), Icons.settings, true, theme.colorScheme.primary),
            buildSmallBoxes([
              {'icon': Icons.memory, 'label': 'AI | Machine learning'},
              {'icon': Icons.memory, 'label': 'Deep Learning'},
              {'icon': Icons.computer, 'label': 'Full stack development'},
              {'icon': Icons.group_work, 'label': 'Scrum | Agile'},
              {'icon': Icons.storage, 'label': 'Data Science | Web Scraping'},
            ], theme.colorScheme.primary, context),
            const SizedBox(height: 20),
            buildCompetenceSectionWithIcon(Provider.of<AppLanguage>(context).translate('ct'), Icons.code, true, theme.colorScheme.primary),
            buildCompetenceSectionWithIcon(Provider.of<AppLanguage>(context).translate('lp'), null, false, theme.textTheme.bodyLarge?.color ?? Colors.grey),
            buildSmallBoxes([
              {'icon': Icons.developer_mode, 'label': 'C'},
              {'icon': Icons.developer_mode, 'label': 'C#'},
              {'icon': Icons.developer_mode, 'label': 'Python'},
              {'icon': Icons.code, 'label': 'JavaScript'},
              {'icon': Icons.code, 'label': 'TypeScript'},
              {'icon': Icons.code, 'label': 'Java'},
              {'icon': Icons.web, 'label': 'HTML'},
              {'icon': Icons.style, 'label': 'CSS'},
              {'icon': Icons.code, 'label': 'PHP'},
              {'icon': Icons.code, 'label': 'Dart'},
            ], theme.colorScheme.primary, context),
            const SizedBox(height: 20),
            buildCompetenceSectionWithIcon(Provider.of<AppLanguage>(context).translate('FrameworksLibrariesTitle'), null, false, theme.textTheme.bodyLarge?.color ?? Colors.grey),
            buildSmallBoxes([
              {'icon': Icons.extension, 'label': 'pandas (pd)'},
              {'icon': Icons.extension, 'label': 'NumPy (np)'},
              {'icon': Icons.show_chart, 'label': 'Matplotlib (plt)'},
              {'icon': Icons.extension, 'label': 'Seaborn (sns)'},
              {'icon': Icons.extension, 'label': 'OpenCV (cv2)'},
              {'icon': Icons.extension, 'label': 'BeautifulSoup (bs4)'},
              {'icon': Icons.extension, 'label': 'scikit-learn'},
              {'icon': Icons.web, 'label': 'Angular'},
              {'icon': Icons.web, 'label': 'Vue.js'},
              {'icon': Icons.web, 'label': 'Node.js'},
              {'icon': Icons.web, 'label': 'Express.js'},
              {'icon': Icons.web, 'label': 'Flask'},
              {'icon': Icons.web, 'label': 'Laravel'},
              {'icon': Icons.web, 'label': 'Symfony'},
              {'icon': Icons.developer_mode, 'label': '.NET'},
              {'icon': Icons.phone_iphone, 'label': 'Flutter'},
            ], theme.colorScheme.primary, context),
            const SizedBox(height: 20),
            buildCompetenceSectionWithIcon(Provider.of<AppLanguage>(context).translate('DatabaseManagementSystemsTitle'), null, false, theme.textTheme.bodyLarge?.color ?? Colors.grey),
            buildSmallBoxes([
              {'icon': Icons.storage, 'label': 'MySQL'},
              {'icon': Icons.storage, 'label': 'SQL Server'},
              {'icon': Icons.storage, 'label': 'Oracle'},
              {'icon': Icons.storage, 'label': 'MongoDB'},
            ], theme.colorScheme.primary, context),
            // Continue with other sections as needed...
          ],
        ),
      ),
    );
  }

  Widget buildCompetenceSectionWithIcon(String title, IconData? iconData, bool isMainCategory, Color color) {
    return Padding(
      padding: EdgeInsets.only(left: isMainCategory ? 0 : 16.0, bottom: 8.0, top: isMainCategory ? 16.0 : 0),
      child: Row(
        children: [
          if (iconData != null) ...[
            Icon(iconData, color: color),
            const SizedBox(width: 8.0),
          ],
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: isMainCategory ? 18 : 16,
              color: color,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSmallBoxes(List<Map<String, dynamic>> competences, Color iconColor, BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: competences.map((competence) => Chip(
        avatar: Icon(
          competence['icon'],
          color: iconColor,
          size: 20.0,
        ),
        label: Text(
          competence['label'],
          style: TextStyle(fontSize: 14, color: theme.textTheme.bodyLarge?.color),
        ),
        backgroundColor: theme.colorScheme.primary.withOpacity(0.1),
        padding: const EdgeInsets.all(8.0),
      )).toList(),
    );
  }
}
