import 'package:desafio_final1_dart/models/APIs/estado_model.dart';
import 'package:desafio_final1_dart/repositories/api_ibge/api_distritos/cidades_repository_impl.dart';
import 'package:desafio_final1_dart/repositories/data_baseMySQL/data_base_repository_impl.dart';
import 'package:mysql1/mysql1.dart';


import 'insert_data_base_repository.dart';

class InsertDataBaseRepositoryImpl implements InsertDataBaseRepository {
  @override
  Future<MySqlConnection> insert(List<EstadoModel> listEstado, DataBaseRepositoryImpl dataBase, CidadesReporitoryImpl cidadesRepository) async{
    var connectDataBase = await dataBase.openConnection();
    try {
      for (var estado in listEstado) {
        await connectDataBase.query(
          'insert into estado (id, nome, uf) values(?,?,?)',
          [
            estado.id,
            estado.nome,
            estado.sigla,
          ]
        );
      
        var listCidades = await cidadesRepository.getCidades(estado.id);
        for (var cidade in listCidades) {
          await connectDataBase.query(
            'insert into cidade (id, id_uf, nome) values(?,?,?)',
            [
              cidade.id,
              cidade.idEstado,
              cidade.nome,
            ]
          );
        }
      }
      return connectDataBase;
    } on Exception catch (e) {
      print(e);
      throw Exception('Erro ao tentar inserir dados no banco');
    }finally{
      connectDataBase.close();
    }
       
  }
   
}