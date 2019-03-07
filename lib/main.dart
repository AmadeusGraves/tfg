import 'package:flutter/material.dart';
import 'eventos.dart';
import 'restaurantes.dart';
import 'agenda.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Roald',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Color.fromRGBO(58, 66, 86 , 1.0),

      ),
      home: MyHomePage(title: 'Roald'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final drawerItems = [
    new DrawerItem("Iniciar Sesion", Icons.person_add),
    new DrawerItem("Eventos", Icons.event),
    new DrawerItem("Restaurantes", Icons.restaurant),
    new DrawerItem("Mi Perfil", Icons.person),
    new DrawerItem("Agenda", Icons.view_agenda),
    new DrawerItem("Todos los Usuarios", Icons.people),
    new DrawerItem("Configuración", Icons.settings)
  ];
  

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
   int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return 0;
      case 1:
        return new Eventos();
      case 2:
        return new Restaurantes();
      case 3:
        return 3;
      case 4:
        return new Agenda();
      case 5:
        return 5;
      case 6:
        return 6;
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).push(
    new MaterialPageRoute(
      builder: (context) => _getDrawerItemWidget(index)
    ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      if(1==1){ // TODO, configurar el if para que no aparezca la agenda y mi perfil cunado no se esta logeado. Para mostrar el perfil !(d.title == "Mi Perfil")
        drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
        );
      }
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
        elevation: 0.1,
        actions: <Widget>[

        ],
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal)
          children: <Widget>[
          new Text("Roald", style: TextStyle(fontSize: 18, color: Color.fromRGBO(255, 255, 255, 1.0)),), 
          new Text("Bienvenidos, esta App esta destinada a organizarte en cuanto al tema de intercalar eventos a los que quieres ir con restaurantes cercanos a los que puedes ir o bien antes, o despues.", textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.w300, color: Color.fromRGBO(255, 255, 255, 1.0)),)
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("None"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
    );
  }
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
  
}

