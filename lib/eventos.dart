import 'package:flutter/material.dart';

class Eventos extends StatefulWidget {
 
 @override
 State<StatefulWidget> createState(){
   return EventosImpl();
 }
} 
class EventosImpl extends State<Eventos>{ 
 int _selectedIndex = 1;
    final _widgetOptions = [
    Text('Index 0: Favoritos'),
    Text('Index 1: Recomendados'),
    Text('Index 2: Todos'),
  ];

    void _onItemTapped(int index) {
    setState(() {
       _selectedIndex = index;
    }); 
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Eventos"),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: _selectedIndex, // this will be set when a new tab is tapped
       onTap: _onItemTapped,
       items: [
         BottomNavigationBarItem(
           icon: new Icon(Icons.favorite),
           title: new Text('Favoritos'),
          
         ),
         BottomNavigationBarItem(
           icon: new Icon(Icons.plus_one),
           title: new Text('Recomendados'),
         ),
         BottomNavigationBarItem(
           icon: Icon(Icons.border_all),
           title: Text('Todos')
         )
       ],
     ),
    );
  }
}

