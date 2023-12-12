import 'package:flutter/cupertino.dart';

abstract interface class PageState<T> with ChangeNotifier {
  emit(T uiData);
  T uiData ();
}
