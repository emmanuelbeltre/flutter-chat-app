import 'package:flutter/cupertino.dart';

class LogoWidget extends StatelessWidget {
  final String titulo;

  const LogoWidget({Key? key, required this.titulo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 170,
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            const Image(image: AssetImage('assets/tag-logo.png')),
            const SizedBox(
              height: 20,
            ),
            Text(
              this.titulo,
              style: TextStyle(fontSize: 30),
            )
          ],
        ),
      ),
    );
  }
}
