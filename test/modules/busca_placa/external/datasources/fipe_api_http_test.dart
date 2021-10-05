import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/external/datasources/fipe_api_http.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('fipe api http ...', () async {
    String apiKey = "";
    final externalI = FipeApiHttp(apiKey: apiKey);

    var result = await externalI.buscarPlaca("ddi4h75");

    expect(result, isA<BuscaPlaca>());
  });
}