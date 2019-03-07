import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';
import 'package:date_format/date_format.dart';

class Agenda extends StatefulWidget {
 
 @override
 State<StatefulWidget> createState(){
   return AgendaImpl();
 }
} 
class AgendaImpl extends State<Agenda>{
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      appBar: AppBar(
        title: Text("Agenda"),
        elevation: 0.1,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Icon(Icons.search),
          ),
        ],
      ),
      body: new ListView.builder(itemBuilder: (context, index) {
        return new StickyHeader(
          header: new Container(
            height: 50.0,
            color: Color.fromRGBO(58, 66, 86 , 1.0),
            padding: new EdgeInsets.symmetric(horizontal: 16.0),
            alignment: Alignment.center,
            child: new Text('${formatDate(DateTime.now().add(new Duration(days:index)),[dd, '-', mm, '-', yyyy])}',
              style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 34),
            ),
          ),
          content: new Container(
            child: Text("data"), // TODO aqui se añaden los eventos y restaurantes que se han reservado.
          ),
        );
      })
    );
  }
 }
