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
    return Scaffold(body: FormPage());
  }
}

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  String? name, age, ice;
  bool isOk = false;
  String? eat;

  String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return "Le champ est obligatoire";
    }
    if (int.parse(value) < 18) {
      return "Mineur interdit !";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              onSaved: (value) {
                name = value;
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Le champ est obligatoire";
                }
                if (value.length < 3) {
                  return "Minimun 3 caractères";
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: "Nom",
                hintText: "Veuillez saisir votre nom...",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              onSaved: (value) {
                age = value;
              },
              validator: validateAge,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Age",
                hintText: "Veuillez saisir votre age...",
                border: OutlineInputBorder(),
              ),
            ),
            DropdownButtonFormField<String>(
              onSaved: (value) {
                ice = value;
              },
              onChanged: (value) {
                print(value);
              },
              initialValue: "",
              items: [
                DropdownMenuItem(
                  child: Text("Choisir une glace"),
                  value: "",
                  enabled: false,
                ),
                DropdownMenuItem(
                  child: Text("Snickers glacé"),
                  value: "snicker",
                ),
                DropdownMenuItem(child: Text("Vienneta"), value: "vienneta"),
                DropdownMenuItem(
                  child: Text("Haggen daz - Macadamia"),
                  value: "haggen",
                ),
              ],
            ),
            Row(
              children: [
                Checkbox(value: isOk, onChanged: (value) {
                  setState(() {
                    isOk = value!;
                  });
                }),
                Text("La <Form> ?"),
              ],
            ),
            RadioGroup(
              groupValue: eat,
              onChanged: (value) {
                setState(() {
                  eat = value;
                });
              },
              child: Column(
                children: [
                  RadioListTile(value: "takeaway", title: Text("A emporter")),
                  RadioListTile(value: "onplace", title: Text("Sur place")),
                ],
              ),
            ),
            OutlinedButton(
              onPressed: () {
                if (_key.currentState!.validate()) {
                  print("$age - $name - $ice - $isOk");
                  _key.currentState!.save();
                  print("$age - $name - $ice - $isOk");
                }
              },
              child: Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
