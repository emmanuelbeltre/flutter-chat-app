import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String ruta;
  final String text;
  final String textButton;
  final Function onTap;

  const LabelWidget(
      {Key? key,
      required this.ruta,
      required this.text,
      required this.textButton,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            this.text,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 15,
                fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 10,
          ),
          GestureDetector(
            child: Text(
              this.textButton,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Navigator.pushReplacementNamed(context, this.ruta);
              this.onTap();
            },
          )
        ],
      ),
    );
  }
}
