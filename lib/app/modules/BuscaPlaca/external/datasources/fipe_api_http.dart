import 'dart:convert';

import 'package:busca_placa_tdd/app/modules/BuscaPlaca/data/datasources/datasource_busca_placa.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/external/models/wrapper.dart';
import 'package:http/http.dart' as http;

class FipeApiHttp implements DataSourceBuscaPlaca {
  String apiKey;
  FipeApiHttp({
    required this.apiKey,
  });
  @override
  Future<BuscaPlaca> buscarPlaca(String? placa) async {
    //https://placas.fipeapi.com.br/placas/{placa}?key={apikey}
    Uri uri =
        Uri.parse("https://placas.fipeapi.com.br/placas/$placa?key=$apiKey");
    var response = await http.get(uri);
    var jsonData = json.decode((response.body));
    print(jsonData);

    final buscaPlaca = BuscaPlacaWrapper.fromJson(jsonData);

    return buscaPlaca;
  }
}
