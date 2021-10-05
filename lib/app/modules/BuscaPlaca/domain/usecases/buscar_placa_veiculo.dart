import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/errors/error_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/repository/repository_busca_placa.dart';
import 'package:dartz/dartz.dart';

abstract class BuscarPlacaVeiculo {
  Future<Either<ErrorBuscaPlaca, BuscaPlaca>> call(String? placa);
}

class BuscarPlacaVeiculoImpl implements BuscarPlacaVeiculo {
  final RepositoryBuscaPlaca buscaPlaca;

  BuscarPlacaVeiculoImpl(this.buscaPlaca);
  @override
  Future<Either<ErrorBuscaPlaca, BuscaPlaca>> call(String? placa) async {
    if (placa != null) {
      String placaCorrigida = placa.replaceAll("-", "");
      if (placaCorrigida.length == 7) {
        return buscaPlaca.buscarPlaca(placaCorrigida);
      }
    }

    return buscaPlaca.buscarPlaca(placa);
  }
}
