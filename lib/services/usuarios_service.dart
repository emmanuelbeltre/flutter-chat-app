import 'package:chat_app/global/enviroment.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/models/usuarios_response.dart';
import 'package:chat_app/services/auth_service.dart';

import 'package:http/http.dart' as http;

class UsuariosService {
  Future<List<Usuario>> getUsuario() async {
    String? token = await AuthService.getToken();

    try {
      final resp = await http.get(Uri.parse('${Enviroment.apiUrl}/usuarios'),
          headers: {
            'Content-Type': 'application/json',
            'x-token': token.toString()
          });

      final usuarioResponse = usuariosResponseFromJson(resp.body);
      return usuarioResponse.usuarios;
    } catch (e) {
      return [];
    }
  }
}
