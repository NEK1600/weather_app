abstract interface class PageState<T> {
  emit(T uiData);
  T uiData ();
}
