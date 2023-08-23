import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/models/credit-card-offer/get_offers_response_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/offer-listing-page/view/widgets/offer_list_item.dart';

class ExtendedCardPageView extends StatelessWidget {
  const ExtendedCardPageView({
    super.key, 
    required this.item, 
    required this.index
  });
  final Offer item;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Stack(
        children: [
          Positioned.fill(child: GestureDetector(onTap: (){Navigator.pop(context);}),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: SizingConstants.horizontalPadding, vertical: SizingConstants.verticalPadding),
            child: Center(
              child: Hero(
                tag: index,
                child: Material(
                  type: MaterialType.transparency,
                  child: OfferListItem(
                    cardName: item.cardName ?? '',
                    imgUrl: item.imgUrl ?? '',
                    isSponsored: item.sponsored == 0 ? false : true,
                    rating: item.rating ?? 0,
                    applyUrl: item.url ?? '',
                    annualPayment: item.annualPayment?.toInt() ?? 0,
                    cashAdvanceInterest: item.cashAdvanceInterest?.toDouble() ?? 0,
                    overdueInterest: item.overdueInterest?.toDouble() ?? 0,
                    shoppingInterest: item.shoppingInterest?.toDouble() ?? 0,
                    isExtendedCardView: true,
                  ),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}