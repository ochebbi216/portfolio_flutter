import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../langue/langue_app.dart';
import '../menu/drawer.widget.dart';

class CodeQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Use Theme.of(context) to use the correct theme colors
    ThemeData themeData = Theme.of(context);

    return Scaffold(
      drawer: MyDrawer(), // Assuming MyDrawer is defined in your project
      appBar: AppBar(
        title: Text(Provider.of<AppLanguage>(context).translate('CodeQRTitle')),
        backgroundColor: Colors.deepPurple,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'images/partage_app_QR.png',
                        fit: BoxFit.cover, // This will cover the full width of container
                      ),
                    ),
                    // Your other widgets go here, wrapped in Expanded if they should take up remaining space
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
