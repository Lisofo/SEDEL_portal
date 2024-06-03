import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    required this.text,
    required this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(50), right: Radius.circular(50)))),
          backgroundColor: WidgetStatePropertyAll(Colors.white),
          elevation: WidgetStatePropertyAll(10)),
      onPressed: onClicked,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          letterSpacing: 1,
          color: Color.fromARGB(255, 52, 120, 62),
        ),
      ),
    );
  }
}
