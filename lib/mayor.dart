import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

class mayor extends StatefulWidget {
  const mayor({Key? key}) : super(key: key);

  @override
  _mayorState createState() => _mayorState();
}

class _mayorState extends State<mayor> {
  final tvalor1 = TextEditingController();
  final tvalor2 = TextEditingController();
  bool isVisible = false;
  var mayor = 0;
  var menor = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.save),
        onPressed: () {
          setState(() {
            isVisible = true;
            int val1 = int.parse(tvalor1.text);
            int val2 = int.parse(tvalor2.text);
            if (val1 > val2) {
              mayor = val1;
              menor = val2;
            } else {
              menor = val1;
              mayor = val2;
            }
          });
        },
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: tvalor1,
              decoration: InputDecoration(
                labelText: 'Primer numero',
              ),
            ),
            TextField(
              controller: tvalor2,
              decoration: InputDecoration(
                labelText: 'Segundo numero',
              ),
            ),
            Visibility(
              visible: isVisible,
              child: Card(
                child: ListTile(
                  title: Text(mayor != menor
                      ? mayor.toString() + " Es mayor que " + menor.toString()
                      : mayor.toString() + " Es igual que " + menor.toString()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
