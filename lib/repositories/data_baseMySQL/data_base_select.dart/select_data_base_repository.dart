import 'package:desafio_final1_dart/models/data_base/cidade_model_data_base.dart';
import 'package:desafio_final1_dart/models/data_base/estado_model_data_base.dart';
import 'package:desafio_final1_dart/repositories/data_baseMySQL/data_base_repository_impl.dart';

abstract class SelectDataBaseRepository {
  Future<List<EstadoModelDataBase>> selectEstados(DataBaseRepositoryImpl dataBase);
  Future<List<CidadeModelDataBase>> selectCidades(DataBaseRepositoryImpl dataBase);
  Future<List<dynamic>> selectCidadesUf(DataBaseRepositoryImpl dataBase);
}