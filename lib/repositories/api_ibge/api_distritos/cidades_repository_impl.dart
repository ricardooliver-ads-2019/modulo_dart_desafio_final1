import 'dart:convert';

import 'package:desafio_final1_dart/models/APIs/cidade_model.dart';
import 'cidades_repository.dart';
import 'package:http/http.dart' as http;

class CidadesReporitoryImpl implements CidadesRepository {
  @override
  Future<List<CidadeModel>> getCidades(id) async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/$id/distritos/';
    var result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      final responseData = jsonDecode(result.body);
       
      if (responseData != null) {
        return responseData.map<CidadeModel>((cidade)=> CidadeModel.fromMap(cidade)).toList();
      }

      return <CidadeModel>[];
      
    } else {
      throw UnimplementedError();
    }
  }

}