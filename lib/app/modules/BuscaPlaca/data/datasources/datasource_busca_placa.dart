import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';


abstract class DataSourceBuscaPlaca {
  Future<BuscaPlaca> buscarPlaca(String? placa);
}