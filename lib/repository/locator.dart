import 'package:get_it/get_it.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/controllers/credit_cart_offer_controller.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/services/credit_card_offer_service.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<CreditCardOfferService>(() => CreditCardOfferService());
  locator.registerLazySingleton<CreditCatrdOfferController>(() => CreditCatrdOfferController());
}