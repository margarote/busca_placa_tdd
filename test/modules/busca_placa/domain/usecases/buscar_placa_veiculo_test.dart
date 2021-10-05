import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/errors/error_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/repository/repository_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/usecases/buscar_placa_veiculo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

//Usando o mockito
class MockRepositoryBuscaPlaca extends Mock implements RepositoryBuscaPlaca {}

class Mock2RepositoryBuscaPlaca implements RepositoryBuscaPlaca {
  @override
  Future<Either<ErrorBuscaPlaca, BuscaPlaca>> buscarPlaca(String? placa) async {
    return Right(BuscaPlaca());
  }
}

//Segundo teste forcando a dar o erro

class MockRepositoryBuscaPlacaError extends Mock implements RepositoryBuscaPlaca {}

class Mock2RepositoryBuscaPlacaError implements RepositoryBuscaPlaca {
  @override
  Future<Either<ErrorBuscaPlaca, BuscaPlaca>> buscarPlaca(String? placa) async {
    return Left(ErrorBuscaPlaca("Ocorreu um erro..."));
  }
}


void main() {
  test('buscar placa veiculo ...', () async {
    final MockRepositoryBuscaPlaca repository = new MockRepositoryBuscaPlaca();
    final Mock2RepositoryBuscaPlaca repository2 = new Mock2RepositoryBuscaPlaca();

    final BuscarPlacaVeiculoImpl usecase = BuscarPlacaVeiculoImpl(repository2);

    /*
    Usando o mockito
    when(usecase.call(""))
        .thenAnswer((realInvocation) async => Right(BuscaPlaca()));
    */
    final result = await usecase.call("");
    final resultData = result.fold((l) => null, (r) => BuscaPlaca());

    expect(resultData, isA<BuscaPlaca>());
  });

  test('forcando a dar um erro', () async {
    final MockRepositoryBuscaPlacaError repository = new MockRepositoryBuscaPlacaError();
    final Mock2RepositoryBuscaPlacaError repository2 = new Mock2RepositoryBuscaPlacaError();

    final BuscarPlacaVeiculoImpl usecase = BuscarPlacaVeiculoImpl(repository2);

    /*
    Usando o mockito
    when(usecase.call(""))
        .thenAnswer((realInvocation) async => Right(BuscaPlaca()));
    */
    final result = await usecase.call("");
    final resultData = result.fold((l) => ErrorBuscaPlaca("Ocorreu um error..."), (r) => BuscaPlaca());

    expect(resultData, isA<ErrorBuscaPlaca>());
  });
}
