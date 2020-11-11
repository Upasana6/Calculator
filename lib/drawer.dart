import 'package:flutter/material.dart';

class DrawerView extends StatelessWidget {
  const DrawerView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            ListTile(
              title: Text('General'),
              onTap: () {
              // Update the state of the app.
              // ...
              },
            ),
            ListTile(
              title: Text('Scientific'),
              onTap: () {
              // Update the state of the app.
              // ...
              },
            ),
          ],
        ),
      ),
    );
  }
}
