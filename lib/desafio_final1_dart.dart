import 'package:desafio_final1_dart/repositories/api_ibge/api_distritos/cidades_repository_impl.dart';
import 'package:desafio_final1_dart/repositories/api_ibge/api_estados/estados_repository_impl.dart';
import 'package:desafio_final1_dart/repositories/data_baseMySQL/data_base_repository_impl.dart';
import 'package:desafio_final1_dart/repositories/data_baseMySQL/data_base_select.dart/select_data_base_repository_impl.dart';
import 'repositories/data_baseMySQL/data_base_insert.dart/insert_data_base_repository_impl.dart';

Future<void> main()async {
  final connect = DataBaseRepositoryImpl();
  final estadosRepository = EstadosRepositoryImpl();
  final cidadesRepository = CidadesReporitoryImpl();
  final insertDataBaseRepository = InsertDataBaseRepositoryImpl();
  final selectEstados = SelectDataBaseRepositoryImpl();

  var mysqlConnection = await connect.openConnection();
  print(mysqlConnection.toString());

  //buscando Estados pela API
  var listEstadoAPI = await estadosRepository.getEstados();
  print('===============ESTADOS API===================');
  print(listEstadoAPI);

  //inserindo os Estados e cidades buscado pela API no banco de dados
  await insertDataBaseRepository.insert(listEstadoAPI, connect, cidadesRepository);

  var listEstadosDataBase = await selectEstados.selectEstados(connect);
  print('===============LISTANDO TODOS OS ESTADOS===================');
  listEstadosDataBase.forEach(((estado) => print(estado)));
  print('Total de ${listEstadosDataBase.length}');

  var listCidadesDataBase = await selectEstados.selectCidades(connect);
  print('===============LISTANDO TODOS OS DISTRITOS===================');
  listCidadesDataBase.forEach(((cidade) => print(cidade)));
  print('Total de cidades${listCidadesDataBase.length}');

  var listCidadesUfDataBase = await selectEstados.selectCidadesUf(connect);
  print('=============== INNER JOIN ===================');
  listCidadesUfDataBase.forEach(((cidade) => print(cidade)));
  print('Total de cidades${listCidadesUfDataBase.length}');

}
