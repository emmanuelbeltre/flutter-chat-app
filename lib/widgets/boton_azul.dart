import 'package:flutter/material.dart';

class BotonAzul extends StatelessWidget {
  // final TextEditingController ctrlEmail;
  // final TextEditingController ctrlPassword;

  // const BotonAzul(
  //     {Key? key, required this.ctrlEmail, required this.ctrlPassword})
  //     : super(key: key);

  final String text;
  final Function onPressed;

  const BotonAzul({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        this.onPressed();
      },
      elevation: 2,
      highlightElevation: 5,
      color: Colors.blue,
      shape: StadiumBorder(),
      child: Container(
        width: double.infinity,
        height: 55,
        child: Center(
          child: Text(
            this.text,
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}
