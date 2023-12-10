import 'package:flutter/cupertino.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/splash.png'),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
