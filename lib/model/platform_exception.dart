class PlatformException implements Exception {
  final String message;
  final String detail;

  const PlatformException(
    this.message, {
    this.detail = '',
  });

  @override
  String toString() {
    return 'PlatformException{ message: $message, detail: $detail,}';
  }
}
