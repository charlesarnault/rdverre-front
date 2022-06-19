import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RDVerre',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Allô'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                for (int i = 0; i < _counter; i++) GadjoForm(),
              ],
            ),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _incrementCounter,
        label: const Text("Ajouter"),
        tooltip: 'Increment',
        icon: const Icon(Icons.add),
      ),
    );
  }
}

// Create a Form widget.
class GadjoForm extends StatefulWidget {
  @override
  GadjoFormState createState() {
    return GadjoFormState();
  }
}

class GadjoFormState extends State<GadjoForm> {
  final _formKey = GlobalKey<FormState>();
  var gadjos = {"name": "", "localization": ""};

  void _editName(text) {
    setState(() {
      gadjos["name"] = text;
    });
  }

  void _editLoc(text) {
    setState(() {
      gadjos["localization"] = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 40, 40, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Nom du gadjo',
              ),
              onChanged: (text) {
                _editName(text);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 5, 40, 0),
            child: TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Localisation du gadjo',
              ),
              onChanged: (text) {
                _editLoc(text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
