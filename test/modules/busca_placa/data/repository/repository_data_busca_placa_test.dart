

import 'package:busca_placa_tdd/app/modules/BuscaPlaca/data/datasources/datasource_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/data/repository/repository_data_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/errors/error_busca_placa.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockDataSourceBuscaPlaca extends Mock implements DataSourceBuscaPlaca {}

class Mock2DataSourceBuscaPlaca implements DataSourceBuscaPlaca {
  @override
  Future<BuscaPlaca> buscarPlaca(String? placa) async{
   try{
     return BuscaPlaca();
   }catch(e){
     throw ErrorBuscaPlaca("Erro ao buscar data");
   }
  }
  
}

//Segundo teste forcando a dar o erro

class MockDataSourceBuscaPlacaError extends Mock implements DataSourceBuscaPlaca {}

class Mock2DataSourceBuscaPlacaError implements DataSourceBuscaPlaca {
  @override
  Future<BuscaPlaca> buscarPlaca(String? placa) async {
    throw ErrorBuscaPlaca("Ocorreu um erro...");
  }
}



void main() {
  test('repository data busca placa ...', () async {
    final MockDataSourceBuscaPlaca repository = new MockDataSourceBuscaPlaca();
    final Mock2DataSourceBuscaPlaca repository2 = new Mock2DataSourceBuscaPlaca();

    final RepositoryDataBuscaPlaca usecase = RepositoryDataBuscaPlaca(repository2);

    /*
    Usando o mockito
    when(usecase.buscarPlaca(""))
        .thenAnswer((realInvocation) async => Right(BuscaPlaca()));
    */
    final result = await usecase.buscarPlaca("");
    final resultData = result.fold((l) => null, (r) => BuscaPlaca());

    expect(resultData, isA<BuscaPlaca>());
  });

  test('Forcando a dar um erro..', () async {
    final MockDataSourceBuscaPlacaError repository = new MockDataSourceBuscaPlacaError();
    final Mock2DataSourceBuscaPlacaError repository2 = new Mock2DataSourceBuscaPlacaError();

    final RepositoryDataBuscaPlaca usecase = RepositoryDataBuscaPlaca(repository2);

    /*
    Usando o mockito
    when(usecase.buscarPlaca(""))
        .thenAnswer((realInvocation) async => Right(BuscaPlaca()));
    */
    final result = await usecase.buscarPlaca("");
    final resultData = result.fold((l) => ErrorBuscaPlaca("Ocorreu um erro..."), (r) => BuscaPlaca());

    expect(resultData, isA<ErrorBuscaPlaca>());
  });
}


