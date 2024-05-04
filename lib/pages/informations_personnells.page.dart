import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart';
import 'MapScreen.page.dart'; // Ensure this import path is correct

class InformationsPersonnelles extends StatelessWidget {
  final String phoneNumber = '52575866';
  final String email = 'omar.chebbi@iit.ens.tn';
  final String linkedInUrl = 'https://www.linkedin.com/in/omar-chebbi-6471bb1ba/';
  final String githubUrl = 'https://github.com/ochebbi216';
  final String portfolioUrl = 'https://ochebbi216.github.io/portfolio/';
  final AppLanguage appLanguage = AppLanguage();

  @override
  Widget build(BuildContext context) {
    // Use Theme.of(context) to use the correct theme colors
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      drawer: MyDrawer(), // Assuming MyDrawer is defined in your project
      appBar: AppBar(
        title: Text(Provider.of<AppLanguage>(context).translate('InformationsPersonnellesTitle'),),
        // Use theme's color for the AppBar
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 100.0,
              backgroundImage: AssetImage('images/profil.jpg'),
            ),
            SizedBox(height: 16.0),
            Text(
              Provider.of<AppLanguage>(context).translate('myName'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: themeData.textTheme.titleLarge?.color, // Adjust text color
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              Provider.of<AppLanguage>(context).translate('descProfil'),
              textAlign: TextAlign.justify,
              style: TextStyle(
                fontSize: 15,
                color: themeData.textTheme.bodyLarge?.color, // Adjust text color
              ),
            ),
            SizedBox(height: 16.0),
            InkWell(
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MapScreen())),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row content
                children: <Widget>[
                  Icon(Icons.location_on, color: themeData.iconTheme.color), // Use theme color for icon
                  SizedBox(width: 8.0),
                  Text(
                    Provider.of<AppLanguage>(context).translate('mapTitle'),
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 16,
                      color: themeData.textTheme.bodyLarge?.color, // Adjust text color
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20.0),
            _buildClickableListTile(
              context,
              title: Provider.of<AppLanguage>(context).translate('tel'),
              iconData: Icons.phone,
              onTap: () => launchUrl(Uri.parse('tel:$phoneNumber')),
            ),
            _buildClickableListTile(
              context,
              title: Provider.of<AppLanguage>(context).translate('mail'),
              iconData: Icons.email,
              onTap: () => launchUrl(Uri.parse('mailto:$email')),
            ),
            _buildClickableListTile(
              context,
              title:Provider.of<AppLanguage>(context).translate('LinkedIn'),
              iconData: Icons.language,
              onTap: () => launchUrl(Uri.parse(linkedInUrl)),
            ),
            _buildClickableListTile(
              context,
              title: Provider.of<AppLanguage>(context).translate('git'),
              iconData: Icons.code,
              onTap: () => launchUrl(Uri.parse(githubUrl)),
            ),
            _buildClickableListTile(
              context,
              title: Provider.of<AppLanguage>(context).translate('portfolio'),
              iconData: Icons.web,
              onTap: () => launchUrl(Uri.parse(portfolioUrl)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClickableListTile(BuildContext context, {required String title, required IconData iconData, required VoidCallback onTap}) {
    ThemeData themeData = Theme.of(context);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 4.0),
      child: ListTile(
        tileColor: themeData.cardColor, // Use the theme's card color
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        leading: Icon(iconData, color: themeData.primaryColor), // Use theme color for icon
        title: Text(
          title,
          style: TextStyle(color: themeData.primaryColor), // Use theme color for text
        ),
        trailing: Icon(Icons.chevron_right, color: themeData.primaryColor), // Use theme color for icon
        onTap: onTap,
      ),
    );
  }
}
