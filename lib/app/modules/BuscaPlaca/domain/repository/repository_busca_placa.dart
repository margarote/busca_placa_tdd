import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/errors/error_busca_placa.dart';
import 'package:dartz/dartz.dart';

abstract class RepositoryBuscaPlaca {
  Future<Either<ErrorBuscaPlaca, BuscaPlaca>> buscarPlaca(String? placa);
}