import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/di/base_provider.dart';
import 'package:weather_app/presentation/widget/login/button_login_widget.dart';
import 'package:weather_app/presentation/widget/login/text_input_widget.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = context.getInheritedWidgetOfExactType<BaseProvider>()!.baseDi.loginCubit();
    return BlocProvider(
      create: (_) => bloc,
      child: LoginPageBase(),
    );
  }
}

class LoginPageBase extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginPageBase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 26, right: 24, top: 11, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 12),
            child: Text(
              "Вход",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
            )
          ),
          const Text(
            "Введите данные для входа",
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xFF8799A5)
            ),
          ),
          const SizedBox(height: 20),
          TextInputWidget(textController: emailController, label: "Email"),
          TextInputWidget(textController: passwordController, label: "Пароль"),
          ButtonLoginWidget(email: emailController.text, password: passwordController.text),
        ],
      ),
    );
  }
}
