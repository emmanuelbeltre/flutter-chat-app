import 'package:chat_app/global/enviroment.dart';
import 'package:chat_app/models/mensajes_response.dart';
import 'package:chat_app/models/usuario.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class ChatService with ChangeNotifier {
  late Usuario usuarioPara;

  Future getChat(String usuariioId) async {
    String? token = await AuthService.getToken();

    final uri = Uri.parse('${Enviroment.apiUrl}/mensajes/$usuariioId');
    final resp = await http.get(uri,
        headers: {'Content-type': 'application/json', 'x-token': token!});

    final mensajesResp = mensajeesResponseFromJson(resp.body);

    return mensajesResp.mensajes;
  }
}
