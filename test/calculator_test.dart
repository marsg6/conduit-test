import 'package:conduit_test/calculator.dart';
import 'package:test/test.dart';

void main() {
  final calculator = Calculator();

  group('Calculator Tests: ', () {
    group('Operation Tests: ', () {
      test('Additions', () {
        expect(calculator.calculate('3 + 5'), equals(8));
        expect(calculator.calculate('13 + 123'), equals(136));
        expect(calculator.calculate('1238 + 2180.5'), equals(3418.5));
      });

      test('Subtractions', () {
        expect(calculator.calculate('10 - 2'), equals(8));
        expect(calculator.calculate('15.5 - 7.25'), equals(8.25));
        expect(calculator.calculate('123.45 - 23.45'), equals(100));
      });

      test('Multiplications', () {
        expect(calculator.calculate('4 * 6'), equals(24));
        expect(calculator.calculate('5.5 * 2'), equals(11));
        expect(calculator.calculate('7.2 * 3.5'), equals(25.2));
      });

      test('Divisions', () {
        expect(calculator.calculate('8 / 2'), equals(4.0));
        expect(calculator.calculate('10.5 / 2.1'), equals(5));
        expect(calculator.calculate('100.0 / 25'), equals(4));
      });
    });

    group('Input Validation Tests: ', () {
      test('Withespaces', () {
        expect(calculator.calculate('3+5'), equals(8));
        expect(calculator.calculate('3 + 5'), equals(8));
        expect(calculator.calculate('  3 + 5  '), equals(8));
        expect(calculator.calculate('    3    +  5 '), equals(8));
        expect(calculator.calculate('3+ 5  '), equals(8));
        expect(calculator.calculate('3 +5'), equals(8));
      });

      test('Operands', () {
        expect(() => calculator.calculate('+ 5'), throwsFormatException);
        expect(() => calculator.calculate('+5 + 5'), throwsFormatException);
        expect(
            () => calculator.calculate('character + 5'), throwsFormatException);
        expect(() => calculator.calculate('5..0 + 5'), throwsFormatException);
        expect(() => calculator.calculate('5 + '), throwsFormatException);
        expect(
            () => calculator.calculate('5 + character'), throwsFormatException);
      });

      test('Operations', () {
        expect(() => calculator.calculate('5 ** 5'), throwsFormatException);
        expect(() => calculator.calculate('5 * 5 + 5'), throwsFormatException);
        expect(() => calculator.calculate('5 // 5'), throwsFormatException);
      });
    });

    group('Edge Case Tests: ', () {
      test('Division by zero', () {
        expect(() => calculator.calculate('5 / 0'), throwsArgumentError);
      });

      test('Negative numbers', () {
        expect(() => calculator.calculate('-3 + 5'), throwsFormatException);
        expect(() => calculator.calculate('3 + -5'), throwsFormatException);
      });

      test('Seperators', () {
        expect(() => calculator.calculate('5,000 + 5'), throwsFormatException);
      });

      test('Others', () {
        expect(calculator.calculate('0000 + 0'), equals(0));
        expect(calculator.calculate('0005 + 0'), equals(5));
        expect(calculator.calculate('0050 + 0'), equals(50));
        expect(calculator.calculate('005.005 + 0'), equals(5.005));
        expect(calculator.calculate('005. + 0'), equals(5));
      });
    });
  });
}
