import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class tabla extends StatefulWidget {
  const tabla({Key? key}) : super(key: key);

  @override
  _tablaState createState() => _tablaState();
}

class _tablaState extends State<tabla> {
  final tvalor = TextEditingController();
  bool isVisible = false;
  var val = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          setState(() {
            val = int.parse(tvalor.text);
            isVisible = true;
          });
        },
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              TextField(
                controller: tvalor,
                decoration: InputDecoration(
                  labelText: 'Numero de la tabla',
                ),
              ),
              for (var i = 1; i < 13; i++)
                Visibility(
                  visible: isVisible,
                  child: Card(
                    child: ListTile(
                      title: Text(tvalor.text +
                          " X " +
                          i.toString() +
                          " = " +
                          "${val * i}"),
                    ),
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}
