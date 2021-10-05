

abstract class Failure{
  final String errorMessage;
  Failure(this.errorMessage);
 
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(String errorMessage) : super(errorMessage);
}

class CacheFailure extends Failure {
  CacheFailure(String errorMessage) : super(errorMessage);
}

class FakeFailure extends Failure {
  FakeFailure(String message) : super(message);
}
