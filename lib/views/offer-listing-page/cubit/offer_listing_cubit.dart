import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/enums/button_list_items.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/controllers/credit_cart_offer_controller.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/locator.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_post_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_response_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/extended-card-page/view/extended_card_page_view.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/model/form_button_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/offer-listing-page/model/form_result_model.dart';

part 'offer_listing_state.dart';

class OfferListingCubit extends Cubit<OfferListingState> {
  OfferListingCubit() : super(const OfferListingInitial());

  Future<void> init(FormResultModel formResultModel) async {

    emit(const OfferListingLoading());
    
    //Get offers with service using getIt.
    GetOffersResponseModel responseModel = await locator.get<CreditCatrdOfferController>().getOffers(getPostModelWithFormResultModel(formResultModel));
    
    //Add sponsoredOffers first, then activeOffers. PassiveOffers in the response model but not used. It can be used if desired. 
    List<Offer> offerList = responseModel.sponsoredOffers ?? [];
    offerList.addAll(responseModel.activeOffers ?? []);

    emit(OfferListingCompleted(offerList: offerList));

  }

  void cardContainerClicked(Offer offer, int index, BuildContext context){
    // OnTap function for route to the ExtendedCardPageView
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        pageBuilder: (_, __, ___) =>
          ExtendedCardPageView(item: offer, index: index,),
      ),
    );
  }

  GetOffersPostModel getPostModelWithFormResultModel(FormResultModel resultModel){

    GetOffersPostModel getOffersPostModel = GetOffersPostModel();

    //Generates fibonacciLists with startIndex and listLenght.
    List<int> fibonacciForSpendingHabits = generateReverseFibonacciList(1, resultModel.spendingHabitsList.length);
    List<int> fibonacciForExpectations= generateReverseFibonacciList(1, resultModel.expectationsList.length);

    //Set the age.
    getOffersPostModel.age = resultModel.age; //Came with +1 from form page.

    //Setting SpendingHabits coefficients.
    for(FormButtonModel item in resultModel.spendingHabitsList){

      //Setting coefficient with sequence number. If sequence number equals to 0 this means not selected. 
      int coefficient = item.sequence == 0 ? 1 : fibonacciForSpendingHabits[item.sequence-1]; //item.sequence came with + 1 for user view. Decrease it because of that.
      
      if(item.id == ButtonListItems.travel){
        getOffersPostModel.travel = coefficient; 
      }
      else if(item.id == ButtonListItems.onlineShopping){
        getOffersPostModel.onlineShopping = coefficient;
      }
      else if(item.id == ButtonListItems.dining){
        getOffersPostModel.dining = coefficient;
      }
      else if(item.id == ButtonListItems.grocery){
        getOffersPostModel.grocery = coefficient;
      }
      else if(item.id == ButtonListItems.bill){
        getOffersPostModel.bill = coefficient;
      }
      else if(item.id == ButtonListItems.other){
        getOffersPostModel.other = coefficient;
      }

    }

    //Setting Expectations coefficients.
    for(FormButtonModel item in resultModel.expectationsList){

      //Setting coefficient with sequence number. If sequence number equals to 0 this means not selected. 
      int coefficient = item.sequence == 0 ? 1 : fibonacciForExpectations[item.sequence-1]; //item.sequence came with + 1 for user view. Decrease it because of that.
      
      if(item.id == ButtonListItems.point){
        getOffersPostModel.point = coefficient; 
      }
      else if(item.id == ButtonListItems.mile){
        getOffersPostModel.mile = coefficient;
      }
      else if(item.id == ButtonListItems.saleCashback){
        getOffersPostModel.saleCashback = coefficient;
      }
      else if(item.id == ButtonListItems.installment){
        getOffersPostModel.installment = coefficient;
      }

    }
    
    return getOffersPostModel;

  }

  List<int> generateReverseFibonacciList(int startIndex, int length) {
  
    List<int> fibonacciList = [];

    if (length <= 0) {
      return fibonacciList;
    }

    int start = startIndex; 
    int current = startIndex+1;
    int temp;

    for (int i = 0; i < length; i++) {
      fibonacciList.add(start);
      temp = start + current;
      start = current;
      current = temp;
    }

    //Convert fibonacci list to reversed fibonacci list and then return it. 
    return fibonacciList.reversed.toList();
  }
  
}

