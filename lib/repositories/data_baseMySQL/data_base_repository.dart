
import 'package:mysql1/mysql1.dart';

abstract class DataBaseRepository {
  Future<MySqlConnection> openConnection();
}