import 'package:flutter/cupertino.dart';

import 'base_di.dart';

class BaseProvider extends InheritedWidget {
  final BaseDi baseDi;
  const BaseProvider({super.key,
    required super.child,
    required this.baseDi
  });

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    print("test1 ${oldWidget}");
    return false;
  }
}