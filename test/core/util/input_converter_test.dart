import 'package:bank_app/core/error/failures.dart';
import 'package:bank_app/core/util/input_converter.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter_test/flutter_test.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInteger', () {
    test(
        'Should return an integer whe the string represents a unsigned integer',
        () async {
      //arrange
      final str = '123';

      final result = inputConverter.stringToUnsignedInteger(str);

      //assert
      expect(result, 123);
    });

    test('Should return a faulire when the string is not integer', () async {
      //arrange
      final str = 'abc';

      final result = inputConverter.stringToUnsignedInteger(str);

      //assert
      expect(result, Left(InvalidInputFailure()));
    });

    test('Should return a faulire when the string is negative integer',
        () async {
      //arrange
      final str = '-123';

      final result = inputConverter.stringToUnsignedInteger(str);

      //assert
      expect(result, Left(InvalidInputFailure()));
    });
  });
}
