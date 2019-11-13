import 'package:mysql1/mysql1.dart';

main(List<String> arguments) {
  var conn = connectMySql();
  conn.then((connection) {
    print('Conectado com sucesso');
    findCargos(connection)
        .then((cargos) => {cargos.forEach((cargo) => print(cargo[1]))});
  });
}

Future<Results> findCargos(MySqlConnection connection) async {
  var sql = "select * from cargo";
  return await connection.query(sql);
}

Future<MySqlConnection> connectMySql() async {
  var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      //password: '',
      db: 'funcionario');
  return await MySqlConnection.connect(settings);
}
