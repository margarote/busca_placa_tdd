import 'package:busca_placa_tdd/core/mainBindings.dart';
import 'package:get/get.dart';

import '../controllers/busca_placa_controller.dart';

class BuscaPlacaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BuscaPlacaController>(
      () => BuscaPlacaController(MainBindigs.buscaPlacaBinding("c41aa1aace7e847a580a933139f54a28")),
    );
  }
}
