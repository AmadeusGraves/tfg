import 'dart:math';
import 'package:flutter/material.dart';
import 'restaurante.dart';
import 'database_creator.dart';
import 'repository_service_restaurante.dart';

void main() async {
  await DatabaseCreator().initDatabase();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SqfLiteCrud(title: 'Flutter Demo Home Page'),
    );
  }
}

class SqfLiteCrud extends StatefulWidget {
  SqfLiteCrud({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SqfLiteCrudState createState() => _SqfLiteCrudState();
}

class _SqfLiteCrudState extends State<SqfLiteCrud> {
  final _formKey = GlobalKey<FormState>();
  Future<List<Restaurante>> future;
  String name;
  int id;

  @override
  initState() {
    super.initState();
    future = RepositoryServiceRestaurante.getAllRestaurantes();
  }

  void readData() async {
    final todo = await RepositoryServiceRestaurante.getRestaurante(id);
    print(todo.name);
  }

  updateRestaurante(Restaurante restaurante) async {
    restaurante.name = 'La chocolateria de Angel';
    await RepositoryServiceRestaurante.updateRestaurante(restaurante);
    setState(() {
      future = RepositoryServiceRestaurante.getAllRestaurantes();
    });
  }

  deleteRestaurante(Restaurante restaurante) async {
    await RepositoryServiceRestaurante.deleteRestaurante(restaurante);
    setState(() {
      id = null;
      future = RepositoryServiceRestaurante.getAllRestaurantes();
    });
  }

  Card buildItem(Restaurante restaurante) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nombre del restaurante: ${restaurante.name}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Info adicional: ${restaurante.info}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  onPressed: () => updateRestaurante(restaurante),
                  child: Text('Editar', style: TextStyle(color: Colors.white)),
                  color: Colors.green,
                ),
                SizedBox(width: 8),
                FlatButton(
                  onPressed: () => deleteRestaurante(restaurante),
                  child: Text('Borrar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  TextFormField buildTextFormField() {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Nombre del restaurante',
        fillColor: Colors.grey[300],
        filled: true,
      ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
      },
      onSaved: (value) => name = value,
    );
  }

  void createRestaurante() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      int count = await RepositoryServiceRestaurante.countRestaurante();
      final restaurante = Restaurante(count, name, "info", false);
      await RepositoryServiceRestaurante.addRestaurante(restaurante);
      setState(() {
        id = restaurante.id;
        future = RepositoryServiceRestaurante.getAllRestaurantes();
      });
      print(restaurante.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Events APP'),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: <Widget>[
          Form(
            key: _formKey,
            child: buildTextFormField(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: createRestaurante,
                child: Text('Crear', style: TextStyle(color: Colors.white)),
                color: Colors.green,
              ),
              RaisedButton(
                onPressed: id != null ? readData : null,
                child: Text('Leer', style: TextStyle(color: Colors.white)),
                color: Colors.blue,
              ),
            ],
          ),
          FutureBuilder<List<Restaurante>>(
            future: future,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(children: snapshot.data.map((todo) => buildItem(todo)).toList());
              } else {
                return SizedBox();
              }
            },
          )
        ],
      ),
    );
  }

}