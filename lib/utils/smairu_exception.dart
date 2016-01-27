library smairu.utils.smairu_exception;

class SmairuException implements Exception {
    final String msg;

    SmairuException(this.msg) {}

    String toString() => 'SmairuException: $msg';
}
