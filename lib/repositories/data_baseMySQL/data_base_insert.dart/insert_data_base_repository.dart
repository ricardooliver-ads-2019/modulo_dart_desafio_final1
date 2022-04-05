import 'package:desafio_final1_dart/models/APIs/estado_model.dart';
import 'package:desafio_final1_dart/repositories/api_ibge/api_distritos/cidades_repository_impl.dart';
import 'package:desafio_final1_dart/repositories/data_baseMySQL/data_base_repository_impl.dart';
import 'package:mysql1/mysql1.dart';

abstract class InsertDataBaseRepository {
  Future<MySqlConnection> insert(List<EstadoModel> listEstado, DataBaseRepositoryImpl dataBase, CidadesReporitoryImpl cidadesRepository);
}