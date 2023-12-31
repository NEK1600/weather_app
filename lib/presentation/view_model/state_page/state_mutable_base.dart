import 'package:flutter/material.dart';
import 'package:weather_app/core/page_state.dart';

class StateMutableBase<T> with ChangeNotifier implements PageState<T> {
  T data;
  StateMutableBase({required this.data});
  @override
  emit(T uiData) {
    data = uiData;
    notifyListeners();
  }

  @override
  T uiData() {
    return data;
  }
}
