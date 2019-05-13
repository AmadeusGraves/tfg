import 'database_creator.dart';
import 'restaurante.dart';

class RepositoryServiceRestaurante {
  static Future<List<Restaurante>> getAllRestaurantes() async{
    final sql = ''' SELECT * FROM ${DatabaseCreator.restauranteTable}
    WHERE ${DatabaseCreator.isDeleted}==0''';
    final data = await db.rawQuery(sql);
    List<Restaurante> restaurantes =List();
    for(final node in data){
      final restaurante = Restaurante.fromJson(node);
      restaurantes.add(restaurante);
    }
    return restaurantes;
  }

  static Future<Restaurante> getRestaurante(int id)  async{
     final sql = ''' SELECT * FROM ${DatabaseCreator.restauranteTable}
     WHERE ${DatabaseCreator.id}==$id''';
     final data = await db.rawQuery(sql);

     final restaurante = Restaurante.fromJson(data[0]);

  }

  static Future<void> addRestaurante(Restaurante restaurante)  async{
       final sql = '''INSERT INTO ${DatabaseCreator.restauranteTable}
    (
      ${DatabaseCreator.id},
      ${DatabaseCreator.name},
      ${DatabaseCreator.info},
      ${DatabaseCreator.isDeleted}
    )
    VALUES (?,?,?,?)''';
    List<dynamic> params = [restaurante.id, restaurante.name, restaurante.info, restaurante.isDeleted ? 1 : 0];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add todo', sql, null, result, params);
   

  }

  static Future<void> deleteRestaurante(Restaurante restaurante)  async{
     final sql = ''' UPDATE ${DatabaseCreator.restauranteTable}
     SET ${DatabaseCreator.isDeleted}=1
     WHERE ${DatabaseCreator.id}==${restaurante.id}''';

     final result = await db.rawUpdate(sql);
     DatabaseCreator.databaseLog('Delete restaurante', sql, null, result);
   

  }

  static Future<void> updateRestaurante(Restaurante restaurante)  async{
      final sql = '''UPDATE ${DatabaseCreator.restauranteTable}
    SET ${DatabaseCreator.name} = ?
    WHERE ${DatabaseCreator.id} = ?
    ''';

    List<dynamic> params = [restaurante.name, restaurante.id];
    final result = await db.rawUpdate(sql, params);

    DatabaseCreator.databaseLog('Update rest', sql, null, result, params);
   

  }

  static Future<int> countRestaurante()  async{
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.restauranteTable}''');

    int count = data[0].values.elementAt(0);
    count++;
    return count;
   

  }



  }
