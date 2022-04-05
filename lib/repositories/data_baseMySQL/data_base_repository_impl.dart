import 'package:mysql1/mysql1.dart';
import 'data_base_repository.dart';

class DataBaseRepositoryImpl implements DataBaseRepository {
  @override
  Future<MySqlConnection> openConnection(){
    try {
      final settings = ConnectionSettings(
        host: 'localhost',
        port: 3306,
        user: 'root',
        password: '123456',
        db: 'locations_brasil'
      );
      return MySqlConnection.connect(settings);
    } on MySqlException catch (e) {
      print(e);
      throw 'Erro ao tentar conexão com a base de dados';
    }
    
  }

}