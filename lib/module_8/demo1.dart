import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'character.dart';

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
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CharacterView(),
    );
  }
}

class CharacterView extends StatefulWidget {
  const CharacterView({super.key});

  @override
  State<CharacterView> createState() => _CharacterViewState();
}

class _CharacterViewState extends State<CharacterView> {
  Character? character;

  Future<Character?> getCharacter() async {
    var response = await http.get(Uri.parse("https://rickandmortyapi.com/api/character/1"));

    if(response.statusCode != 200){
      throw Exception("Erreur !");
    }else{
       var body = response.body;
       var data = jsonDecode(body);
       setState(() {
         character = Character.fromJson(data);
       });

       return character;
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCharacter();
  }

  @override
  Widget build(BuildContext context) {
    final character = this.character;
    if(character != null){
      return Column(
        children: [
          Text(character.name),
          Image.network(character.imageUrl),
          FutureBuilder(future: getCharacter(), builder: (context, AsyncSnapshot<Character?> snapshot) {
            if(snapshot.hasData){
              var ricky = snapshot.data;
              return Column(
                children: [
                  Text(ricky!.name),
                  Image.network(ricky.imageUrl)
                ],
              );
            }
            return CircularProgressIndicator();
          },)

        ],
      );
    }
    return CircularProgressIndicator();
  }
}



