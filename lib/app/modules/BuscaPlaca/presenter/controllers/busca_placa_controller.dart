import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/entities/busca_placa_entities.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/domain/usecases/buscar_placa_veiculo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuscaPlacaController extends GetxController {
  final BuscarPlacaVeiculoImpl buscarPlacaVeiculoImpl;

  BuscaPlacaController(this.buscarPlacaVeiculoImpl);
  final TextEditingController placa = TextEditingController();
  Rx<StatusBuscaPlaca> status = StatusBuscaPlaca.NONE.obs;

  Rx<BuscaPlaca> dataModel = BuscaPlaca().obs;

  
  Future<void> send() async {
    status.value = StatusBuscaPlaca.NONE;
    try {
      status.value = StatusBuscaPlaca.AWAITING;
      var result = await buscarPlacaVeiculoImpl.call(placa.text);

      dataModel.value = result.fold((l) => BuscaPlaca(), (r) => r);
      if (dataModel.value.data == null) {
        status.value = StatusBuscaPlaca.ERROR;
      } else {
        status.value = StatusBuscaPlaca.DONE;
      }
    } catch (e) {
      print(e);
    }
  }
}

enum StatusBuscaPlaca { NONE, AWAITING, DONE, ERROR }
