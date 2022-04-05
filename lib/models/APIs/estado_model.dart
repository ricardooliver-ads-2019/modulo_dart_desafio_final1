
import 'dart:convert';

class EstadoModel {
  final int id;
  final String sigla;
  final String nome;

  EstadoModel({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  factory EstadoModel.fromMap(Map<String, dynamic> map){
    return EstadoModel(
      id: map['id']?.toInt() ?? 0, 
      sigla: map['sigla'] ?? '', 
      nome: map['nome'] ?? '',
    );
  }


  factory EstadoModel.fromJson(String json){
    var jsonData = jsonDecode(json);
    return EstadoModel.fromMap(jsonData);
  }

  Map<String, dynamic> toMap(){
    return{
      'id':  id,
      'sigla': sigla,
      'nome': nome,  
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'EstadoModel(id: $id, sigla: $sigla, nome: $nome)';
}


