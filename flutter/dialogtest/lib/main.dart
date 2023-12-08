import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alert Dialog',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Playground(),
    );
  }
}

class Playground extends StatelessWidget {
  TextEditingController _textFieldController = TextEditingController();

  _displayDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('AlertDemo with TextField '),
            content: TextField(
              controller: _textFieldController,
              decoration: InputDecoration(hintText: "Enter Text"),
            ),
            actions: [
              new TextButton(
                child: new Text('SUBMIT'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Dialog Demo'),
      ),
      body: Center(
        child: TextButton(
          child: Text(
            'Show Alert',
            style: TextStyle(fontSize:  20.0 ),),

          onPressed: () => _displayDialog(context),
        ),
      ),
    );
  }
}