import 'package:dev_radar/network/git_requests.dart';
import 'package:dev_radar/network/stack_requests.dart';

abstract class ResultsState {}

class ResultsLoading extends ResultsState {}

class ResultsLoaded extends ResultsState {
  List<Contributor>? contriburors;
  List<AnswererItem>? answerers;
  ResultsLoaded({
    this.contriburors,
    this.answerers,
  });
}
