import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_plugin/pages/categoriesPage.dart';
import 'package:flutter_plugin/pages/homePage.dart';

class Drawer_navi extends StatefulWidget {
  @override
  _Drawer_naviState createState() => _Drawer_naviState();
}

class _Drawer_naviState extends State<Drawer_navi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(''),
              ),
              accountName: Text('Praveen'),
              accountEmail: Text('Praveen@gmail.com'),
              decoration: BoxDecoration(color: Colors.blue),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => HomePage())),
            ),
            ListTile(
              leading: Icon(Icons.category),
              title: Text('Categories'),
              onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => CategoriesPage())),
            )
          ],
        ),
      ),
    );
  }
}
