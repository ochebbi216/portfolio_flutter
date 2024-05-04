import 'package:flutter/material.dart';
import 'package:omarchebbi/menu/drawer.widget.dart'; // Ensure this import is correct
import 'package:provider/provider.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../langue/langue_app.dart';

class Formation_Academique extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var appLanguage = Provider.of<AppLanguage>(context); // Getting the AppLanguage instance

    // Utilizing theme data for consistent theming
    ThemeData theme = Theme.of(context);
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title:  Text(appLanguage.translate('FormationAcademiqueTitle')),
        // Using theme's primary color
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              buildTimelineTile(
                context,
                title: appLanguage.translate('EngineeringTitle'),
                subtitle: appLanguage.translate('EngineeringSubtitle'),
                iconData: Icons.engineering,
                isFirst: true,
              ),
              buildTimelineTile(
                context,
                title: appLanguage.translate('BigDataTitle'),
                subtitle: appLanguage.translate('BigDataSubtitle'),
                iconData: Icons.analytics,
              ),
              buildTimelineTile(
                context,
                title: appLanguage.translate('HighSchoolDiplomaTitle'),
                subtitle: appLanguage.translate('HighSchoolDiplomaSubtitle'),
                iconData: Icons.school,
                isLast: true,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimelineTile(
      BuildContext context, {
        required String title,
        required String subtitle,
        required IconData iconData,
        bool isFirst = false,
        bool isLast = false,
      }) {
    ThemeData theme = Theme.of(context);
    Color lineColor = theme.dividerColor;
    EdgeInsetsGeometry padding = const EdgeInsets.symmetric(vertical: 0.0);
    LineStyle lineStyle = LineStyle(color: lineColor, thickness: 3.5); // Adjust thickness as needed

    return Padding(
      padding: padding,
      child: TimelineTile(
        alignment: TimelineAlign.manual,
        lineXY: 0.1,
        isFirst: isFirst,
        isLast: isLast,
        indicatorStyle: IndicatorStyle(
          width: 40,
          iconStyle: IconStyle(
            iconData: iconData,
            color: Colors.white,
          ),
          color: theme.colorScheme.primary,
        ),
        beforeLineStyle: isFirst ? LineStyle(color: Colors.transparent) : lineStyle,
        afterLineStyle: isLast ? LineStyle(color: Colors.transparent) : lineStyle,
        endChild: buildCard(theme, title, subtitle),
      ),
    );
  }

  Widget buildCard(ThemeData theme, String title, String subtitle) {
    var parts = subtitle.split('|');
    var datePart = parts[0].trim();
    var locationPart = parts.length > 1 ? parts[1].trim() : '';

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: theme.textTheme.bodyLarge?.color,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: <Widget>[
                  Icon(Icons.date_range, size: 16, color: theme.iconTheme.color),
                  SizedBox(width: 4),
                  Text(
                    datePart,
                    style: TextStyle(fontSize: 16, color: theme.textTheme.bodyLarge?.color),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Icon(Icons.place, size: 16, color: theme.iconTheme.color),
                  SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      locationPart,
                      style: TextStyle(fontSize: 16, color: theme.textTheme.bodyLarge?.color),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
