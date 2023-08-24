import 'package:teklifimgelsin_flutter_assignment_bloc/core/service/abstracts/a_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/core/service/managers/dio_service_manager.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/service/service_paths.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_post_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_response_model.dart';

class CreditCardOfferService{
  Future<GetOffersResponseModel> getOffers(GetOffersPostModel postModel) async {
    GetOffersPostModel getOffersPostModel = GetOffersPostModel(
      age: 4,
      bill: 8,
      dining: 5,
      grocery: 1,
      installment: 5,
      mile: 2,
      onlineShopping: 3, 
      other: 13, 
      point: 3, 
      saleCashback: 1, 
      travel: 2
    );
    GetOffersResponseModel getOffersResponseModel = GetOffersResponseModel();
    
    //Create serviceManager.
    AServiceManager serviceManager = DioServiceManager();

    //Send post request with post model and add results response model.
    await serviceManager.instance?.post(ServicePaths().getCardOffers(), getOffersPostModel, getOffersResponseModel, null, null, null);

    return getOffersResponseModel;
  }
}