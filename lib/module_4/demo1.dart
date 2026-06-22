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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: IceCreamList(),
    );
  }
}

class IceCreamList extends StatelessWidget {
  IceCreamList({super.key});

  List<String> iceCreams = [
    "Magmun",
    "Mister freeze",
    "Esquimaux",
    "Cookie Dough",
    "Magmun",
    "Mister freeze",
    "Esquimaux",
    "Cookie Dough",
    "Magmun",
    "Mister freeze"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: iceCreams.length,
        itemBuilder: (context, index) {
          return Container(
            color: Colors.cyanAccent,
            height: 100,
            child: Text(iceCreams[index]),
          );
        },
      ),
    );
  }
}

class BigPage extends StatelessWidget {
  const BigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Row(
          children: [
            Column(
              children: [
                Text("Debut du scroll"),
                SizedBox(height: 2500),
                Text("Fin du scroll"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [Text("Ligne 1"), Text("Ligne 2"), Text("Ligne 3")],
          ),
        ],
      ),
    );
  }
}
