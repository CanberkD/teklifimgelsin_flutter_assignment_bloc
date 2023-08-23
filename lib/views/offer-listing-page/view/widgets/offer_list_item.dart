import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/project_colors.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/offer-listing-page/view/widgets/rating_info.dart';

import 'apply_button.dart';
import 'card_image_and_name.dart';
import 'extended_info_row_item.dart';

class OfferListItem extends StatelessWidget {
  const OfferListItem({
    super.key,
    required this.imgUrl,
    required this.cardName,
    required this.isSponsored,
    required this.rating,
    required this.annualPayment,
    required this.shoppingInterest,
    required this.overdueInterest,
    required this.cashAdvanceInterest,
    required this.applyUrl,
    required this.isExtendedCardView,
  });
  final String imgUrl;
  final String cardName;
  final bool isSponsored;
  final num rating;
  final int annualPayment;
  final double shoppingInterest;
  final double overdueInterest;
  final double cashAdvanceInterest;
  final String applyUrl;
  final bool isExtendedCardView;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: isExtendedCardView ? 250 : 200,
      decoration: BoxDecoration(
      color: ProjectColors.pureWhite,
      border: Border.all(width: 0.5, color: ProjectColors.mainGrey),
      borderRadius: BorderRadius.circular(SizingConstants.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: SizingConstants.horizontalPadding, vertical: SizingConstants.verticalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: CardImageAndName(
                imageUrl: imgUrl,
                cardName: cardName,
              )
            ),
            Expanded(
              flex: 1,
              child: RatingWidget(
                isSponsored: isSponsored,
                rating: isSponsored ? 100 : rating.toInt(),
              )
            ),
            if(isExtendedCardView) ...[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ExtendedInfoRowItem(title: 'Yıllık Ödeme',value: annualPayment.toString()),
                  ExtendedInfoRowItem(title: 'Alışveriş Faizi',value: shoppingInterest.toString()),
                  ExtendedInfoRowItem(title: 'Gecikme Faizi',value: overdueInterest.toString()),
                  ExtendedInfoRowItem(title: 'Nakit Avans Faizi',value: cashAdvanceInterest.toString())
                ],
              ),
            ],
            SizedBox(
              child: ApplyButton(applyUrl: applyUrl, isSponsored: isSponsored),
            )
          ],
        ),
      ),
    );
  }
}