import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/busca_placa_controller.dart';

class BuscaPlacaView extends GetView<BuscaPlacaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buscar Placa"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Informe sua placa",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                controller: controller.placa,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Obx(() => controller.status.value.index == 1
                ? CircularProgressIndicator()
                : FlatButton(
                    onPressed: () {
                      controller.send();
                    },
                    child: Text("Enviar"))),
            SizedBox(
              height: 5,
            ),
            Obx(
              () => controller.status.value.index == 3
                  ? Text(
                      "Ocorreu um erro",
                      style: TextStyle(color: Colors.red),
                    )
                  : Container(),
            ),
            SizedBox(
              height: 30,
            ),
            Obx(
              () => controller.status.value.index == 2
                  ? controller.dataModel.value.data != null
                      ? Text("UF: ${controller.dataModel.value.data!.veiculo!.uf ?? ""},\nANO: ${controller.dataModel.value.data!.veiculo!.ano ?? ""},\nCMT: ${controller.dataModel.value.data!.veiculo!.cmt ?? ""},\nCOR: ${controller.dataModel.value.data!.veiculo!.cor ?? ""},\nPBT: ${controller.dataModel.value.data!.veiculo!.pbt ?? ""},\nPLACA: ${controller.dataModel.value.data!.veiculo!.placa ?? ""},\nCHASSI: ${controller.dataModel.value.data!.veiculo!.chassi ?? ""},\nMOTOR: ${controller.dataModel.value.data!.veiculo!.nMotor ?? ""},\nPOTENCIA: ${controller.dataModel.value.data!.veiculo!.potencia ?? ""},\nMUNICIPIO: ${controller.dataModel.value.data!.veiculo!.municipio ?? ""},\nCARROCERIA: ${controller.dataModel.value.data!.veiculo!.carroceria ?? ""},\nCILINDRADAS: ${controller.dataModel.value.data!.veiculo!.cilindradas ?? ""},\nCOMBUSTIVEL: ${controller.dataModel.value.data!.veiculo!.combustivel ?? ""},\nPROCEDENCIA: ${controller.dataModel.value.data!.veiculo!.procedencia ?? ""},\nCAIXA CAMBIO: ${controller.dataModel.value.data!.veiculo!.caixaCambio ?? ""},\nMARCA MODELO: ${controller.dataModel.value.data!.veiculo!.marcaModelo ?? ""},\nTIPO MONTAGEM: ${controller.dataModel.value.data!.veiculo!.tipoMontagem ?? ""},\nTIPO CARROCERIA: ${controller.dataModel.value.data!.veiculo!.tipoCarroceria ?? ""},\nTIPO VEÍCULO: ${controller.dataModel.value.data!.veiculo!.tipoDeVeiculo ?? ""},\nEIXO TRAZEIRO: ${controller.dataModel.value.data!.veiculo!.eixoTraseiroDif ?? ""},\nSITUACAO CHASSI: ${controller.dataModel.value.data!.veiculo!.situacaoDoChassi ?? ""},\nCAPACIDADE DE CARGA: ${controller.dataModel.value.data!.veiculo!.capacidadeDeCarga ?? ""},\nQUANTIDADE DE EIXOS: ${controller.dataModel.value.data!.veiculo!.quantidadeDeEixos ?? ""},\nQUANTIDADE DE PASSAGEIROS: ${controller.dataModel.value.data!.veiculo!.quantidadePassageiro ?? ""},\nFIPE: \n${controller.dataModel.value.data!.fipes!.map((e) => "[CODIGO: ${e.codigo ?? ""},\nMODELO: ${e.marcaModelo ?? ""},\nVALOR: ${e.valor ?? ""}],").toList().toString().replaceAll("[", "").replaceAll("]", "")}", textAlign: TextAlign.left, style: TextStyle(
                        fontSize: 20
                      ),)
                      : Container()
                  : Container(),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }
}
