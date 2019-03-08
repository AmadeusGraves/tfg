import 'package:flutter/material.dart';
import 'package:rest_event/main.dart';

class Login extends StatefulWidget {
  
 
 @override
 State<StatefulWidget> createState(){
   return LoginImpl();
 }
} 
class LoginImpl extends State<Login>{
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: new Container(
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("lib/images/login.jpg"),
              fit: BoxFit.none,
            ),
          ),
          child: SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              children: <Widget>[
                SizedBox(height: 80),
                Column(
                  children: <Widget>[
                    Image.asset('assets/login_icon.png'),
                    SizedBox(height: 20.0),
                    Text('LOGIN',style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
                  ],
                ),
                SizedBox(height: 80),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Usuario',
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                  ),
                ),
                SizedBox(height: 40),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Contraseña',
                    filled: true,
                    fillColor: Color.fromRGBO(255, 255, 255, 0.7),
                    
                  ),
                  obscureText: true,
                ),
                ButtonBar(
                  children: <Widget>[
                    FlatButton(
                      child: Text('Cancelar'),
                      onPressed: (){
                        Navigator.pop(context);
                      },
                    ),
                    RaisedButton(
                      child: Text('Siguiente'),
                      onPressed: (){

                      },
                    )
                  ],
                )
              ],
            ),
        ),
      )
    );
  }
}