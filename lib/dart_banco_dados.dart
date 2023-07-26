import 'package:dart_banco_dados/database.dart';
import 'package:mysql1/mysql1.dart';

Future<void> main() async {
  final database = Database();
  var mysqlConnection = await database.openConnection();
  print(mysqlConnection.toString());

  await mysqlConnection.query('insert into aluno(id, nome) values(?, ?)',
      [null, 'Guilherme']);

  var resultadoSelect = await mysqlConnection.query('select * from aluno');
  resultadoSelect.forEach((row) {
    print('Resultado por Indice');
    print(row[0]);
    print(row[1]);
    print('Resultado pelo nome da coluna');
    print(row['id']);
    print(row['nome']);
    print('\n');
  });

  var resultadoSelectUnico =
      await mysqlConnection.query('select * from aluno where id = ?', [1]);
  print('Parametro Unico');
  if (resultadoSelectUnico.isNotEmpty) {
    var rowUnico = resultadoSelectUnico.first;
    print('Resultado por Indice');
    print(rowUnico[0]);
    print(rowUnico[1]);
    print('Resultado pelo nome da coluna');
    print(rowUnico['id']);
    print(rowUnico['nome']);
    print('\n');
  }

  try {
    await mysqlConnection.query('update aluno set nome = ? where id = ?',
        ['Guilherme Potter Petry atualizado', 1]);
  } on MySqlException catch (e) {
    print(e);
    print('Erro ao atualizar dados do aluno');
  }
}
