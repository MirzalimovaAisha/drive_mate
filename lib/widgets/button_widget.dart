import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  final VoidCallback onPressed;
  final String text;

  const ButtonWidget({super.key, required this.onPressed, required this.text});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45,
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          backgroundColor: Color(0xffbc001b),
          foregroundColor: Colors.white
        ),
        child: Text(widget.text, style: TextStyle(fontSize: 16),),
      ),
    );
  }
}
