
import 'package:desafio_final1_dart/models/APIs/estado_model.dart';

abstract class EstadosRepository {
  Future<List<EstadoModel>> getEstados(); 
}