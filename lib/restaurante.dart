import 'database_creator.dart';
class Restaurante{
  int id;
  String name;
  String info;
  bool isDeleted;

  Restaurante(this.id, this.name, this.info,this.isDeleted);

  Restaurante.fromJson(Map<String, dynamic> json){
    this.id= json[DatabaseCreator.id];
    this.name= json[DatabaseCreator.name];
    this.info= json[DatabaseCreator.info];
    this.isDeleted= json[DatabaseCreator.isDeleted] == 1 ;


  }



}