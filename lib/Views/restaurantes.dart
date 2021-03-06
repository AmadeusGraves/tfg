import 'package:flutter/material.dart';

class Restaurantes extends StatefulWidget {
 
 @override
 State<StatefulWidget> createState(){
   return RestaurantesImpl();
 }
} 
class RestaurantesImpl extends State<Restaurantes>{ 
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
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text("Restaurantes"),
        elevation: 0.1,
        

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


 
