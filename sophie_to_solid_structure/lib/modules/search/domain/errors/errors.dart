abstract class FailureSearch implements Exception{}

abstract class FailureView implements Exception{}

class InvalidTextError implements FailureSearch{
  final dynamic message;
  InvalidTextError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "InvalidTextError";
    return "InvalidTextError: $message";
  }
}

class DataSourceError implements FailureSearch{
  final dynamic message;
  DataSourceError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "DataSourceError";
    return "DataSourceError: $message";
  }
}

class IndexError implements FailureView{
  final dynamic message;
  IndexError({this.message});

  String toString() {
    Object message = this.message;
    if (message == null) return "IndexError";
    return "IndexError: $message";
  }
}