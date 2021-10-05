
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/data_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/fipes_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/veiculo_entities.dart';

class BuscaPlacaWrapper {
  static BuscaPlaca fromJson(Map json) {
    return BuscaPlaca(
      data: DataWrapper.fromJson(json['data']),
    );
  }
}

class DataWrapper {
  static Data fromJson(Map json) {
    return Data(
      fipes:
          List<Fipes>.from(json['fipes']?.map((x) => FipesWrapper.fromJson(x))),
      veiculo: VeiculoWrapper.fromJson(json['veiculo']),
    );
  }
}

class FipesWrapper {
  static Fipes fromJson(Map json) {
    return Fipes(
      codigo: json['codigo'],
      marcaModelo: json['marcaModelo'],
      valor: json['valor'],
    );
  }
}

class VeiculoWrapper {
  static Veiculo fromJson(Map json) {
    return Veiculo(
      uf: json['uf'],
      ano: json['ano'],
      cmt: json['cmt'],
      cor: json['cor'],
      pbt: json['pbt'],
      placa: json['placa'],
      chassi: json['chassi'],
      nMotor: json['n_motor'],
      potencia: json['potencia'],
      municipio: json['municipio'],
      carroceria: json['carroceria'],
      cilindradas: json['cilindradas'],
      combustivel: json['combustivel'],
      procedencia: json['procedencia'],
      caixaCambio: json['caixa_cambio'],
      marcaModelo: json['marca_modelo'],
      tipoMontagem: json['tipo_montagem'],
      tipoCarroceria: json['tipo_carroceria'],
      tipoDeVeiculo: json['tipo_de_veiculo'],
      eixoTraseiroDif: json['eixo_traseiro_dif'],
      situacaoDoChassi: json['situacao_do_chassi'],
      capacidadeDeCarga: json['capacidade_de_carga'],
      quantidadeDeEixos: json['quantidade_de_eixos'],
      quantidadePassageiro: json['quantidade_passageiro'],
    );
  }
}
