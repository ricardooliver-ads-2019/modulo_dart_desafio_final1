
import 'dart:convert';

class CidadeModel {
  final int? id;
  final int idEstado;
  final String nome;

  CidadeModel({
    required this.nome,
    this.id,
    required this.idEstado,
  });

  factory CidadeModel.fromMap(Map<dynamic, dynamic> map){
    return CidadeModel(
      nome: map['nome'] ?? '',
      idEstado: map['municipio']['microrregiao']['mesorregiao']['UF']['id']?.toInt() ?? 0,
      id: int.parse(map['id']),
    );
  }

  factory CidadeModel.fromJson(String json) => CidadeModel.fromMap(jsonDecode(json));

  Map<dynamic, dynamic> toMap(){
    return{
      'id' : id,
      'idEstado' : idEstado,
      'nome' : nome,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'CidadeModel(id: $id, idEstado: $idEstado, nome: $nome)';
}
