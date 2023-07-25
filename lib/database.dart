import 'package:mysql1/mysql1.dart';

class Database {
  Future<MySqlConnection> openConnection() {
    final connectionSettings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'AcademiaDoFlutter',
      password: 'academiadoflutter',
      db: 'dart_mysql',
    );

    return MySqlConnection.connect(connectionSettings);
  }
}
