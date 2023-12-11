class TestException implements Exception {
  final String message;
  TestException({required this.message});
  @override
  String toString() {
    return "ошибка теста ${message}";
  }
}
