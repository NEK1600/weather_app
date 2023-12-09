import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogBasePage extends StatelessWidget {
  final String message;
  const DialogBasePage({super.key, required this.message});
  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      content: Text(message),
      actions: [
        TextButton(
          child: const Text("OK"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        )
      ],
    );
  }
}
