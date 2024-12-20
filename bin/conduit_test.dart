import 'package:conduit_test/calculator.dart';

// 조금 불편하지만, 문제의 의도가 명령줄 인수를 받아서 계산기를 실행하는 것이라고 가정하고 진행했습니다.

/// ex) dart run bin/conduit_test.dart "1 + 1"
void main(List<String> arguments) {
  final calculator = Calculator();
  try {
    print(calculator.calculate(arguments[0]));
  } catch (e) {
    print(e);
  }
}
