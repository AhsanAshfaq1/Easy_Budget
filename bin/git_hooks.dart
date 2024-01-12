import 'package:dart_pre_commit/dart_pre_commit.dart';
import 'package:git_hooks/git_hooks.dart';

void main(List<String> arguments) {
  Map<Git, UserBackFun> params = {
    Git.commitMsg: _conventionalCommitMsg,
    Git.preCommit: _preCommit,
  };
  GitHooks.call(arguments, params);
}

Future<bool> _preCommit() async {
  final result = await DartPreCommit.run();
  return result.isSuccess;
}

Future<bool> _conventionalCommitMsg() async {
  var commitMsg = Utils.getCommitEditMsg();

  RegExp conventionCommitPattern = RegExp(
      r'''^(feat|fix|refactor|build|chore|perf|ci|docs|revert|style|test|merge){1}(\([\w\-\.]+\))?(!)?:( )?([\w ])+([\s\S]*)''');

  if (conventionCommitPattern.hasMatch(commitMsg)) {
    return true;
  } else if (!RegExp(
          r'(feat|fix|refactor|build|chore|perf|ci|docs|revert|style|test|merge)')
      .hasMatch(commitMsg)) {
    // ignore: avoid_print
    print(
        '🛑 Invalid type used in commit message. It should be one of (feat|fix|refactor|build|chore|perf|ci|docs|revert|style|test|merge)');
  } else {
    // ignore: avoid_print
    print(
        '🛑 Commit message should follow conventional commit pattern: https://www.conventionalcommits.org/en/v1.0.0/');
  }

  return false;
}
