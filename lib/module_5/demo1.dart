import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PasswordWidget(label : "Nouveau label trop cool"),
    );
  }
}

class PasswordWidget extends StatefulWidget {
  String label;
  PasswordWidget({super.key, required this.label});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {

  //Etat local
  bool isVisible = false;

  void _toogleVisibility(bool value){
    setState(() {
      isVisible = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              obscureText: !isVisible,
              decoration: InputDecoration(labelText: widget.label),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(isVisible ? Icons.lock_open : Icons.lock ),
                Switch(value: isVisible, onChanged: _toogleVisibility)
              ],
            )
          ],
        ),
      ),
    );
  }
}





