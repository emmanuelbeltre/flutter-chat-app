import 'package:chat_app/helpers/mostrar_alertas.dart';
import 'package:chat_app/services/auth_service.dart';
import 'package:chat_app/services/socket_service.dart';
import 'package:chat_app/widgets/boton_azul.dart';
import 'package:chat_app/widgets/custom_input.dart';
import 'package:chat_app/widgets/labels.dart';
import 'package:chat_app/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LogoWidget(
                  titulo: 'Registro',
                ),
                _Form(),
                LabelWidget(
                  ruta: 'login',
                  text: '¿Ya tienes una cuenta?',
                  textButton: 'Inicia sesión adora!',
                  onTap: () {
                    Navigator.pushReplacementNamed(context, 'login');
                  },
                ),
                const Text(
                  'Terminos y condiciones de uso',
                  style: TextStyle(fontWeight: FontWeight.w200),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  State<_Form> createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final socketService = Provider.of<SocketService>(context);

    return Container(
      margin: EdgeInsets.only(top: 40),
      padding: EdgeInsets.symmetric(horizontal: 50),
      child: Column(children: <Widget>[
        CustomInput(
          icon: Icons.perm_identity,
          placeHolder: 'Nombre',
          keyboardType: TextInputType.text,
          textController: nameCtrl,
        ),
        CustomInput(
          icon: Icons.mail_outline,
          placeHolder: 'Email',
          keyboardType: TextInputType.emailAddress,
          textController: emailCtrl,
        ),

        CustomInput(
          icon: Icons.lock_outline,
          placeHolder: 'Password',
          isPassword: true,
          textController: passwordCtrl,
        ),
        // ElevatedButton(
        //   onPressed: () {},
        //   child: Text('data')
        //   ,
        // )
        BotonAzul(
          text: 'Crear cuenta',
          onPressed: () async {
            FocusScope.of(context).unfocus();

            final registerOk = await authService.register(nameCtrl.text.trim(),
                emailCtrl.text.trim(), passwordCtrl.text.trim());

            if (registerOk == true) {
              //TODO: Conectar al socket service

              socketService.connect();

              Navigator.pushReplacementNamed(context, 'usuarios');
            } else {
              //TODO: Mostrar alerta
              MostrarAlerta(context, 'Registro incorrecto', registerOk);
            }
          },
        ),
      ]),
    );
  }
}
