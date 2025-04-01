import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  final String text;
  final bool? obscureText;
  final Widget icon;
  final TextEditingController? controller;
  const TextFieldWidget({super.key, required this.text, this.obscureText, required this.icon, this.controller});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      height: 45,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
          color: Color(0xfff7f7f7),
          borderRadius: BorderRadius.circular(7)
      ),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.obscureText ?? false,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.text,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 14),
            prefixIcon: widget.icon,
            prefixIconColor: Colors.grey
        ),
      ),
    );
  }
}
