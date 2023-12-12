import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/presentation/view_model/login_page_cubit.dart';

class ButtonLoginWidget extends StatelessWidget {
  final TextEditingController email;
  final TextEditingController password;
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
            context.read<LoginPageCubit>().login(email.text, password.text);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF0700FF)),
          ),
          child: const Text("Войти", style: TextStyle(color: Colors.white),)
      ),
    );
  }
}
