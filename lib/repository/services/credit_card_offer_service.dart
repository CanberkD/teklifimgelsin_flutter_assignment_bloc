import 'package:teklifimgelsin_flutter_assignment_bloc/core/service/abstracts/a_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/core/service/managers/dio_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/service/service_paths.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_post_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_response_model.dart';

class CreditCardOfferService{
  Future<GetOffersResponseModel> getOffers(GetOffersPostModel postModel) async {

    GetOffersResponseModel getOffersResponseModel = GetOffersResponseModel();
    
    //Create serviceManager.
    AServiceManager serviceManager = DioServiceManager();

    //Send post request with post model and add results response model.
    await serviceManager.instance?.post(ServicePaths().getCardOffers(), postModel, getOffersResponseModel, null, null, null);

    return getOffersResponseModel;
  }
}