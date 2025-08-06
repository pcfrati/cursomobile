//& Teste de Conversão de JSON para DART
import 'dart:convert'; // nativa  >  não precisa baixar para o pubspec

void main() {
  String UsuarioJson = '''{
                            "id": "1ab2",
                            "user": "usuario1",
                            "nome": "Pedro",
                            "idade": 25,
                            "cadastrado": true
                      }''';
  //* para manipular o texto
  //* converter (decode) JSON em Map
  Map<String, dynamic> usuario = json.decode(UsuarioJson);
  //* manipulando informações do JSON  >  Map
  print(usuario["idade"]);
  usuario["idade"] = 26;
  //* conveter (encode) Map em JSON em Map
  UsuarioJson = json.encode(usuario);
  //* tenho novamente um JSON em formato de texto
  print(UsuarioJson);
}
