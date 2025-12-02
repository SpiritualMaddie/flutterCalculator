import 'package:flutter_calc/utils/calculate_methods.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  group("calculate()", () {
    test("basic arithmetic", () {
      expect(calculate("1+1"), "2");
      expect(calculate("2*5"), "10");
    });

    test("order of operations", () {
      expect(calculate("2+3*4"), "14");
    });

    test("error handling", () {
      expect(calculate("2+"), "Error!");
      expect(calculate("8/0"), "Den gick inte");
    });
  });
}
