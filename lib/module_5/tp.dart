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
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  double total = 0;

  void calculateTotal(double price){
    setState(() {
      total += price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ArticleItem(name: "Thé glacé", price: 2.5, updateTotal : calculateTotal),
          ArticleItem(name: "Coca bien frais", price: 22.5, updateTotal : calculateTotal),
          ArticleItem(name: "Limonade", price: 2.5, updateTotal : calculateTotal),
          ArticleItem(name: "Ventilateur", price: 27.5, updateTotal : calculateTotal),
          Text("Total = $total€")
        ],
      ),
    );
  }
}


class ArticleItem extends StatefulWidget {
  String name;
  double price;
  void Function(double) updateTotal;
  ArticleItem({super.key, required this.name, required this.price, required this.updateTotal});

  @override
  State<ArticleItem> createState() => _ArticleItemState();
}

class _ArticleItemState extends State<ArticleItem> {
  int quantity = 0;

  void _increment(){
    setState(() {
      quantity++;
      widget.updateTotal(widget.price);
    });
  }

  void _decrement(){
    setState(() {
      if(quantity > 0)
          quantity--;
        widget.updateTotal(-widget.price);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text("${widget.name} (${widget.price})"),
        IconButton(icon: Icon(Icons.remove), onPressed: _decrement),
        Text("$quantity"),
        IconButton(icon: Icon(Icons.add), onPressed: _increment ),
        Text("Total =  ${quantity * widget.price}€")
      ],
    );
  }
}








