
import 'package:desafio_final1_dart/models/APIs/cidade_model.dart';

abstract class CidadesRepository {
  Future<List<CidadeModel>> getCidades(int id);
}