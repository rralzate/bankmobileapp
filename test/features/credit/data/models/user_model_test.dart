import 'dart:convert';

import 'package:bank_app/features/credit/data/models/calification_response_model.dart';
import 'package:bank_app/features/credit/domain/entities/calification_response.dart';

import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixtures_reader.dart';

void main() {
  const tCalificationModel = CalificationResponseModel(calificacion: 'AA');

  test('Should be a subclass of User Entity ', () async {
    //assert
    expect(tCalificationModel, isA<CalificatioResponse>());
  });

  group('fromJson', () {
    test(
      'Should return a valid model when the JSON calification is string ',
      () async {
        //Arrange
        final Map<String, dynamic> jsonMap =
            json.decode(fixture('ConsultarCentralRiesgos.json'));

        //Act
        final result = CalificationResponseModel.fromMap(jsonMap);

        //Assert
        expect(result, equals(tCalificationModel));
      },
    );
    // test(
    //   'Should return a valid model when the JSON calification is number ',
    //   () async {
    //     //Arrange
    //     final Map<String, dynamic> jsonMap =
    //         json.decode(fixture('ConsultarCentralRiesgosNumber.json'));

    //     //Act
    //     final result = CalificationResponseModel.fromMap(jsonMap);

    //     //Assert
    //     expect(result, equals(tCalificationModel));
    //   },
    // );
  });

  group('toJson', () {
    test(
      'Should return JSON map containing the proper data ',
      () async {
        //Act

        final result = tCalificationModel.toMap();

        //Assert
        final expectedMap = {"Calificacion": 'AA'};
        expect(result, expectedMap);
      },
    );
  });
}
