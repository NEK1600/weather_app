import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonLoginWidget extends StatelessWidget {
  final String email;
  final String password;
  const ButtonLoginWidget({super.key,
    required this.email,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {

          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF0700FF)),
          ),
          child: const Text("Войти", style: TextStyle(color: Colors.white),)
      ),
    );
  }
}
