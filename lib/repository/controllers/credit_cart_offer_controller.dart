import 'package:teklifimgelsin_flutter_assignment_bloc/repository/locator.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_post_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_response_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/services/credit_card_offer_service.dart';

class CreditCatrdOfferController {

  Future<GetOffersResponseModel> getOffers(GetOffersPostModel postModel){
    return locator.get<CreditCardOfferService>().getOffers(postModel); 
  }

}