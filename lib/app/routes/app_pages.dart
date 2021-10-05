import 'package:busca_placa_tdd/app/modules/BuscaPlaca/presenter/bindings/busca_placa_binding.dart';
import 'package:busca_placa_tdd/app/modules/BuscaPlaca/presenter/views/busca_placa_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BUSCA_PLACA;

  static final routes = [
    GetPage(
      name: _Paths.BUSCA_PLACA,
      page: () => BuscaPlacaView(),
      binding: BuscaPlacaBinding(),
    ),
  ];
}
