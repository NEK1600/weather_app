import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProgressDialogWidget extends StatelessWidget {
  const ProgressDialogWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Dialog(
        child: SizedBox(
          height: 60,
          child:Padding(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:  <Widget> [
                Text("Пожалуйста ожидайте..."),
                CupertinoActivityIndicator(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
