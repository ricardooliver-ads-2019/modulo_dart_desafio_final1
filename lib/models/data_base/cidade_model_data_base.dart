
import 'dart:convert';

class CidadeModelDataBase {
  final int? id;
  final int idEstado;
  final String nome;

  CidadeModelDataBase({
    required this.nome,
    this.id,
    required this.idEstado,
  });

  factory CidadeModelDataBase.fromMap(Map<dynamic, dynamic> map){
    
    return CidadeModelDataBase(
      nome: map['nome'] ?? '',
      idEstado: map['id_uf']?.toInt() ?? 0,
      id: map['id']?.toInt() ?? 0,
    );
  }

  factory CidadeModelDataBase.fromJson(String json) => CidadeModelDataBase.fromMap(jsonDecode(json));

  Map<dynamic, dynamic> toMap(){
    return{
      'id' : id,
      'idEstado' : idEstado,
      'nome' : nome,
    };
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() => 'CidadeModelDataBase(id: $id, idEstado: $idEstado, nome: $nome)';
}
