
import 'package:flutter_test/flutter_test.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/locator.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/controllers/credit_cart_offer_controller.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_post_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_response_model.dart';

void main(){
  setup();

  test('Get it service test.', () async {
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

    GetOffersResponseModel responseModel = await locator.get<CreditCatrdOfferController>().getOffers(getOffersPostModel);

    expect(responseModel.activeOffers?.first.bankId, isNotNull);
  });
}