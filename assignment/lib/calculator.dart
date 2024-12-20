import 'package:collection/collection.dart';

enum Operation {
  add('+'),
  subtract('-'),
  multiply('*'),
  divide('/'),
  ;

  const Operation(this.sign);
  final String sign;

  static Operation? fromSign(String sign) => Operation.values.firstWhereOrNull(
        (operation) => operation.sign == sign,
      );
}

/// 현재 요구사항은 연산자의 위치가 중앙으로 되어 있으나, 추후 삼각함수, 미적분, 로그 등 복잡한 연산식이 들어올 경우, 연산자의 위치가 달라질 가능성이 높다. 그럴 경우, [_parseInput]과 [_isValidInput]을 수정해야 한다.
class Calculator {
  num _add(num a, num b) {
    return a + b;
  }

  num _subtract(num a, num b) {
    return a - b;
  }

  num _multiply(num a, num b) {
    return a * b;
  }

  num _divide(num a, num b) {
    if (b == 0) {
      throw ArgumentError('Cannot divide by zero');
    }
    return a / b;
  }

  num calculate(String input) {
    if (!_isValidInput(input)) {
      throw FormatException('Invalid input format');
    }

    final (leftOperand, operation, rightOperand) = _parseInput(input);

    return switch (operation) {
      Operation.add => _add(leftOperand, rightOperand),
      Operation.subtract => _subtract(leftOperand, rightOperand),
      Operation.multiply => _multiply(leftOperand, rightOperand),
      Operation.divide => _divide(leftOperand, rightOperand),
    };
  }

  (num leftOperand, Operation operation, num rightOperand) _parseInput(
      String input) {
    final operation =
        Operation.values.firstWhere((element) => input.contains(element.sign));

    final [leftPart, rightPart] = input.split(operation.sign);

    final leftOperand = num.parse(leftPart.trim());
    final rightOperand = num.parse(rightPart.trim());

    return (leftOperand, operation, rightOperand);
  }

  bool _isValidInput(String input) {
    // TODO: regex로 한번에 검증하기 때문에, 디테일한 케이스를 에러로 캐치하기 어려운 점이 아쉽다.
    final operandRegex = r'[0-9]+[.]?[0-9]*';
    final operationRegex =
        '[${Operation.values.map((operation) => '\\${operation.sign}').join('')}]';

    final inputRegex = RegExp(
        r'^\s*$operandRegex\s*$operationRegex\s*$operandRegex\s*$'
            .replaceAll(r'$operandRegex', operandRegex)
            .replaceAll(r'$operationRegex', operationRegex));

    return inputRegex.hasMatch(input);
  }
}
