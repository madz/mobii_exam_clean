abstract class Failure {
  const Failure();
}

class UnknownFailure extends Failure {
  const UnknownFailure({
    this.message,
  });

  final String? message;
}
