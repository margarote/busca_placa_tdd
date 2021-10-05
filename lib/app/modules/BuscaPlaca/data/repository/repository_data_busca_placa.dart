import 'package:busca_placa_tdd/app/modules/BuscaPlaca/data/datasources/datasource_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/errors/error_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/repository/repository_busca_placa.dart';
import 'package:dartz/dartz.dart';

class RepositoryDataBuscaPlaca implements RepositoryBuscaPlaca {
  final DataSourceBuscaPlaca dataSourceBuscaPlaca;

  RepositoryDataBuscaPlaca(this.dataSourceBuscaPlaca);
  @override
  Future<Either<ErrorBuscaPlaca, BuscaPlaca>> buscarPlaca(String? placa) async {
    try {
      var result =  await dataSourceBuscaPlaca.buscarPlaca(placa);
      return Right(result);
    } catch (e) {
      return Left( ErrorBuscaPlaca("Erro ao buscar a placa: ${e.toString()}"));
    }
  }
}
