import 'package:desafio_final1_dart/models/APIs/estado_model.dart';
import 'package:http/http.dart' as http;
import './estados_repository.dart';
import 'dart:convert' as convert;

class EstadosRepositoryImpl implements EstadosRepository {
  @override
  Future<List<EstadoModel>> getEstados() async {
    var url = 'https://servicodados.ibge.gov.br/api/v1/localidades/estados/';
    var result = await http.get(Uri.parse(url));
    if (result.statusCode == 200) {
      var resultData = convert.jsonDecode(result.body);
      if (resultData != null) {
        //for (var estado in resultData) {
        //  print(estado.runtimeType);          
        //}
        return resultData.map<EstadoModel>((classEstato) => EstadoModel.fromMap(classEstato)).toList();
      }
      return <EstadoModel>[];
      
    } else {
      throw Exception("Erro ao buscar Estados");
    }
    
  }

}