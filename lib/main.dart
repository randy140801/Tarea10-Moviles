import 'dart:io';

import 'package:flutter/material.dart';
import 'package:multifuncion/mayor.dart';
import 'tabla.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: home(),
    );
  }
}

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  String url = 'https://randomuser.me/api/portraits/men/32.jpg';
  String bgimg =
      'https://images.unsplash.com/photo-1549490316-686f9b5d359f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80';

  int _selectDrawerItem = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return tabla();
      case 1:
        return mayor();
    }
  }

  _onSelectItem(int p) {
    setState(() {
      _selectDrawerItem = p;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MultiFuncion'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Randy Frias'),
              accountEmail: Text('Mobile Developer'),
              currentAccountPicture: CircleAvatar(
                child: ClipOval(
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: NetworkImage(bgimg),
                fit: BoxFit.cover,
              )),
            ),
            ListTile(
              leading: Icon(Icons.calculate_outlined),
              title: Text('Tabla de multiplicar'),
              onTap: () {
                _onSelectItem(0);
              },
            ),
            ListTile(
              leading: Icon(Icons.arrow_forward_ios),
              title: Text('Numero mayor'),
              onTap: () {
                _onSelectItem(1);
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Salir'),
              onTap: () => exit(0),
            ),
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectDrawerItem),
    );
  }
}
