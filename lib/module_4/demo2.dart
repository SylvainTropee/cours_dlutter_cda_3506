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
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              print("coucou");
            },
            child: Text("Click ici !"),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_a_photo_outlined),
                Text("Take a picture !"),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            label: Text("Take a picture"),
            icon: Icon(Icons.add_a_photo),
          ),
          Image.network(
            "https://upload.wikimedia.org/wikipedia/en/thumb/a/a0/Grogu_%28Star_Wars%29.jpg/250px-Grogu_%28Star_Wars%29.jpg",
          ),
          // Image.network(
          //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpId_wxCtEPrnzvPlMZWE7jPt0eilkWJ40VQ&s",
          // ),
          // // Image.network(
          //   webHtmlElementStrategy: WebHtmlElementStrategy.prefer,
          //   "https://commons.wikimedia.org/wiki/File:Yellow-eyed_Babbler_in_Bhigwan_August_2025_by_Tisha_Mukherjee_09.jpg",
          // ),
          Image.asset("img/pomme.jpg")
        ],
      ),
    );
  }
}
