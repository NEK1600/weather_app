import 'package:flutter/material.dart';

class TextInputWidget extends StatelessWidget {
  final TextEditingController textController;
  final String label;
  const TextInputWidget({super.key,
    required this.textController,
    required this.label
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10 , top: 10),
      child: SizedBox(
        height: 70,
        child: TextField(
          controller: textController,
          decoration: InputDecoration.collapsed(
            hintText: label,
            border: const UnderlineInputBorder(),
            hintStyle: const TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}
