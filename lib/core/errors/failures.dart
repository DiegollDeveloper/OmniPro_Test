abstract class Failure {}

class HomeFailure extends Failure {
  final String message;

  HomeFailure({required this.message});
}
