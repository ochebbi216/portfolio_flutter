import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart';
import '../main.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AppLanguage appLanguage = AppLanguage();

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context, listen: false);
    // Get the primary and secondary colors from the theme
    // Define colors and styles using the current theme context
    Color primaryColor = Theme.of(context).primaryColor;
    Color iconColor = Theme.of(context).iconTheme.color ?? Colors.black;
    TextStyle listItemStyle = TextStyle(
      color: Theme.of(context).textTheme.bodyLarge?.color ?? Colors.black,
      fontSize: 18,
    );

    return Drawer(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/home'), // Handle tap for the entire header area
            child: UserAccountsDrawerHeader(
              accountName: Text(
                Provider.of<AppLanguage>(context).translate('myName'),
                style: TextStyle(fontSize: 24, color: Colors.white), // Use secondaryColor for text
              ),
              accountEmail: null, // Hide accountEmail by setting it to null
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("images/profil.jpg"), // Display profile image
              ),
              decoration: BoxDecoration(color: Colors.deepPurple), // Using backgroundColor variable here
            ),
          ),

          Expanded(
            child: ListView(
              children: [
                _createDrawerItem(
                  icon: Icons.person,
                  text: Provider.of<AppLanguage>(context).translate('InformationsPersonnellesTitle'),
                  onTap: () => Navigator.pushNamed(context, '/informations_personnells'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.star,
                  text: Provider.of<AppLanguage>(context).translate('CompetencesTitle'),
                  onTap: () => Navigator.pushNamed(context, '/competences'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.school,
                  text: Provider.of<AppLanguage>(context).translate('FormationAcademiqueTitle'),
                  onTap: () => Navigator.pushNamed(context, '/formation_academique'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.work,
                  text: Provider.of<AppLanguage>(context).translate('ExperiencesProfessionnellesTitle'),
                  onTap: () => Navigator.pushNamed(context, '/experience_professionnelles'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.lightbulb_outline,
                  text: Provider.of<AppLanguage>(context).translate('ProjetsAcademiquesTitle'),
                  onTap: () => Navigator.pushNamed(context, '/projets_academiques'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.card_membership,
                  text: Provider.of<AppLanguage>(context).translate('CertificationsTitle'),
                  onTap: () => Navigator.pushNamed(context, '/certifications'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.language,
                  text: Provider.of<AppLanguage>(context).translate('LanguesTitle'),
                  onTap: () => Navigator.pushNamed(context, '/langues'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.favorite,
                  text: Provider.of<AppLanguage>(context).translate('InteretsTitle'),
                  onTap: () => Navigator.pushNamed(context, '/interets'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                _createDrawerItem(
                  icon: Icons.qr_code_scanner,
                  text: Provider.of<AppLanguage>(context).translate('CodeQRTitle'),
                  onTap: () => Navigator.pushNamed(context, '/codeQR'),
                  iconColor: iconColor,
                  textStyle: listItemStyle,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Provider.of<AppLanguage>(context).translate('LanguesTitle'), style: TextStyle(fontSize: 16)),
                      Row(
                        children: <Widget>[
                          _languageButton(context, 'fr', 'Français'),
                          SizedBox(width: 8), // Spacing between buttons
                          _languageButton(context, 'en', 'English'),
                          SizedBox(width: 8), // Spacing between buttons
                          _languageButton(context, 'ar', 'العربية'),
                        ],
                      ),
                    ],
                  ),
                ),
                SwitchListTile(
                  title: Text(themeManager.themeMode == ThemeMode.dark ||
                      (themeManager.themeMode == ThemeMode.system && MediaQuery.of(context).platformBrightness == Brightness.dark)
                      ? Provider.of<AppLanguage>(context).translate('DarkMode')
                      : Provider.of<AppLanguage>(context).translate('DayMode')),
                  value: themeManager.themeMode == ThemeMode.dark ||
                      (themeManager.themeMode == ThemeMode.system && MediaQuery.of(context).platformBrightness == Brightness.dark),
                  onChanged: (bool value) {
                    themeManager.toggleTheme(value);
                  },
                  secondary: Icon(themeManager.themeMode == ThemeMode.dark ||
                      (themeManager.themeMode == ThemeMode.system && MediaQuery.of(context).platformBrightness == Brightness.dark)
                      ? Icons.nightlight_round : Icons.wb_sunny),
                ),


                // ... other _createDrawerItem calls
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _languageButton(BuildContext context, String languageCode, String buttonText) {
    return ElevatedButton(
      onPressed: () {
        Provider.of<AppLanguage>(context, listen: false).setLanguage(languageCode);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(48, 36), // Ensures a minimal size for tap targets
        padding: EdgeInsets.symmetric(horizontal: 8),
        textStyle: TextStyle(fontSize: 12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.language, size: 16),
          SizedBox(width: 15),
          Text(buttonText),
        ],
      ),
    );
  }
  Widget _createDrawerItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    required Color iconColor,
    required TextStyle textStyle,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(text, style: textStyle),
      onTap: onTap,
    );
  }
}
