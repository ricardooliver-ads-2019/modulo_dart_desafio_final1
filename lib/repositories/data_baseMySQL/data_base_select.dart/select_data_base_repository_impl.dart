// ignore_for_file: void_checks, avoid_function_literals_in_foreach_calls

import 'package:desafio_final1_dart/models/data_base/cidade_model_data_base.dart';
import 'package:desafio_final1_dart/models/data_base/estado_model_data_base.dart';
import 'package:desafio_final1_dart/repositories/data_baseMySQL/data_base_repository_impl.dart';

import './select_data_base_repository.dart';

class SelectDataBaseRepositoryImpl implements SelectDataBaseRepository {
  
  @override
  Future<List<EstadoModelDataBase>> selectEstados(DataBaseRepositoryImpl dataBase) async{
    var connetDataBase = await dataBase.openConnection();
    try {
      var listEstadoBase = await connetDataBase.query('select * from estado');
      List<EstadoModelDataBase> estadosList = [];
      listEstadoBase.forEach((element)=> estadosList.add(EstadoModelDataBase.fromMap(element.fields)));
      return estadosList;
      
    } on Exception catch (e) {
      print(e);
      throw Exception('Erro ao listar os Estados do banco');

    }finally{
      connetDataBase.close();
    }
    
  }

  @override
  Future<List<CidadeModelDataBase>> selectCidades(DataBaseRepositoryImpl dataBase) async{
    var connetDataBase = await dataBase.openConnection();
    try {
      var listCidadesDataBase = await connetDataBase.query('select * from cidade');
      List<CidadeModelDataBase> cidadesList = [];
      listCidadesDataBase.forEach((cidade)=> cidadesList.add(CidadeModelDataBase.fromMap(cidade.fields)));
      return cidadesList;
      
    } on Exception catch (e) {
      print(e);
      throw Exception('Erro ao listar as Cidades do banco');

    }finally{
      connetDataBase.close();
    }
    
  }

  @override
  Future<List<dynamic>> selectCidadesUf(DataBaseRepositoryImpl dataBase) async{
    var connetDataBase = await dataBase.openConnection();
    try {
      var listCidadesDataBase = await connetDataBase.query('select cidade.nome, cidade.id_uf, estado.uf from cidade  inner join estado on cidade.id_uf = estado.id');
      List<dynamic> cidadesList = [];
      if (listCidadesDataBase.isNotEmpty) {
        listCidadesDataBase.forEach((cidade)=> cidadesList.add(cidade.fields));
        return cidadesList;
      }
      return cidadesList;
      
    } on Exception catch (e) {
      print(e);
      throw Exception('Erro ao listar as Cidades do banco');

    }finally{
      connetDataBase.close();
    }
  }

}