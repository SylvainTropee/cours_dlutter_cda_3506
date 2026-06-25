import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
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
      routes: {
        "/page-1" : (context) => PageOne(),
        "/page-2" : (context) => PageTwo(),
      },
      initialRoute: "/page-1",
    );
  }
}

class PageOne extends StatelessWidget {
  const PageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          Text("PAGE 1"),
          OutlinedButton(onPressed: () {
            Navigator.pushNamed(context, "/page-2", arguments: 123);
          }, child: Text("Go to page 2 !")),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});


  @override
  Widget build(BuildContext context) {

    int number = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        children: [
          Text("PAGE 2 - $number"),
          OutlinedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Back where you want !"),
          ),
        ],
      ),
    );
  }
}
