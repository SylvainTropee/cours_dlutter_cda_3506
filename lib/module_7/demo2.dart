import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: "/page-1",
  routes: [
    GoRoute(path: "/page-1", builder: (context, state) => PageOne()),
    GoRoute(
      path: "/page-2/:id",
      builder: (context, state) {

        int IdProduct2 = state.extra as int;
        int idProduct = int.parse(state.pathParameters['id']!); //state.queryParameters[key] ?clé=value
        return PageTwo(idProduct: idProduct);
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
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
          OutlinedButton(
            onPressed: () {
              context.push("/page-2/789456", extra: 123);
            },
            child: Text("Go to page 2 !"),
          ),
        ],
      ),
    );
  }
}

class PageTwo extends StatelessWidget {
  int idProduct;

  PageTwo({super.key, required this.idProduct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Column(
        children: [
          Text("PAGE 2 - $idProduct"),
          OutlinedButton(
            onPressed: () {
              context.pop();
            },
            child: Text("Back where you want !"),
          ),
        ],
      ),
    );
  }
}
