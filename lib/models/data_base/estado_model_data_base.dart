
import 'dart:convert';

class EstadoModelDataBase {
  final int id;
  final String sigla;
  final String nome;

  EstadoModelDataBase({
    required this.id,
    required this.sigla,
    required this.nome,
  });

  factory EstadoModelDataBase.fromMap(Map<String, dynamic> map){
    return EstadoModelDataBase(
      id: map['id']?.toInt() ?? 0, 
      sigla: map['uf'] ?? '', 
      nome: map['nome'] ?? '',
    );
  }


  factory EstadoModelDataBase.fromJson(String json){
    var jsonData = jsonDecode(json);
    return EstadoModelDataBase.fromMap(jsonData);
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
  String toString() => 'EstadoModelDataBase(id: $id, sigla: $sigla, nome: $nome)';
}


