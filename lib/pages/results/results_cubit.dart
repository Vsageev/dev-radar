import 'package:dev_radar/network/git_requests.dart';
import 'package:dev_radar/network/stack_requests.dart';
import 'package:dev_radar/pages/results/results_states.dart';
import 'package:excel/excel.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultsCubit extends Cubit<ResultsState> {
  final String communityName;
  final String? gitUrl;
  final String? stackUrl;

  ResultsCubit({required this.communityName, this.gitUrl, this.stackUrl}) : super(ResultsLoading()) {
    initRes();
  }

  initRes() async {
    List<Contributor> contributors = [];
    List<AnswererItem> answerers = [];

    if (gitUrl != null) {
      contributors = await GitRequests.getContributors(gitUrl!);
    }
    if (stackUrl != null) {
      answerers = await StackRequests.getAnswerers(stackUrl!);
    }

    emit(ResultsLoaded(answerers: answerers, contriburors: contributors));
  }

  downloadData(dynamic data) {
    if (data is List<Contributor>) {
      var excel = Excel.createExcel();
      excel.appendRow('Sheet1', [
        'Nickname',
        'Url',
        'Contributions count',
      ]);

      for (var contributor in data) {
        excel.appendRow('Sheet1', contributor.toRow());
      }

      excel.save(fileName: 'contributors.xlsx');
    }
    if (data is List<AnswererItem>) {
      var excel = Excel.createExcel();
      excel.appendRow('Sheet1', [
        'Nickname',
        'Url',
        'Score',
        'Posts',
      ]);

      for (var answerer in data) {
        excel.appendRow('Sheet1', answerer.toRow());
      }

      excel.save(fileName: 'answerers.xlsx');
    }
  }
}
