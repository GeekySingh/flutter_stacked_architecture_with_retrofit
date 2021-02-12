/// Result class will be used to hold result of network call which can be
/// success (with data) or failure (with error information)
class Result<T> with SealedResult<T> {}

class Success<T> extends Result<T> {
  T data;

  Success(this.data);
}

class Error<T> extends Result<T> {
  String error;

  Error(this.error);
}

abstract class SealedResult<T> {
  R when<R>({
    R Function(T) success,
    R Function(String) error,
  }) {
    if (this is Success<T>) {
      return success?.call(((this as Success).data));
    }
    if (this is Error<T>) {
      return error?.call(((this as Error<T>).error));
    }
    throw new Exception(
        'If you got here, probably you forgot to regenerate the classes? Try running flutter packages pub run build_runner build');
  }
}
