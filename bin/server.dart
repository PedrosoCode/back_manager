import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;

// Função para lidar com as requisições
Response _echoRequest(Request request) {
  return Response.ok('Hello, this is a GET response from the Dart backend!');
}

void main() async {
  // Roteador básico
  var handler =
      const Pipeline().addMiddleware(logRequests()).addHandler(_echoRequest);

  // Iniciando o servidor
  var server = await io.serve(handler, InternetAddress.anyIPv4, 8080);

  print('Server listening on port ${server.port}');
}
