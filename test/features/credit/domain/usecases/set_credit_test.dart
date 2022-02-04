import 'package:bank_app/features/credit/data/models/credit_data_model.dart';
import 'package:bank_app/features/credit/domain/entities/credit_response.dart';
import 'package:bank_app/features/credit/domain/usescases/set_credit.dart';
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bank_app/features/credit/domain/repositories/credit_repository.dart';

class MockCredit extends Mock implements CreditReposiroty {}

void main() {
  late SetCredit usecase;

  late MockCredit mockCredit;

  setUp(() {
    mockCredit = MockCredit();
    usecase = SetCredit(mockCredit);
  });

  CreditDataModel creditModel =
      const CreditDataModel(calificacion: 'A', numeroDocumento: '7500024455');

  CreditResponse creditResponse = const CreditResponse(message: 'OK');

  test('Should Set Credit Repository', () async {
    // arrange
    when(mockCredit.setCredito(creditModel))
        .thenAnswer((_) async => Right(creditResponse));

    //act
    final result = await usecase(Params(credit: creditModel));

    //assert
    expect(result, Right(creditResponse));
    verify(mockCredit.setCredito(creditModel));
    verifyNoMoreInteractions(mockCredit);
  });
}
