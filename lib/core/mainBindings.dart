
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/data/repository/repository_data_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/usecases/buscar_placa_veiculo.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/external/datasources/fipe_api_http.dart';

class MainBindigs {
  static BuscarPlacaVeiculoImpl buscaPlacaBinding(String apiKey) => BuscarPlacaVeiculoImpl(RepositoryDataBuscaPlaca(FipeApiHttp(apiKey: apiKey)));
}