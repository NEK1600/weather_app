import 'package:flutter/material.dart';
import 'package:weather_app/core/page_state.dart';

class StateMutableBase<T> with ChangeNotifier implements PageState<T> {
  T? _data;
  @override
  emit(T uiData) {
    _data = uiData;
    notifyListeners();
  }

  @override
  T uiData() {
    return _data!;
  }

  @override
  bool emptyState() {
    return _data == null;
  }
}
