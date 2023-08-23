import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/project_colors.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.isSponsored,
    required this.rating
  });

  final bool isSponsored;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(!isSponsored ? 'Uyumluluk %${rating.toString()}' : 'Sponsorlu', 
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: !isSponsored ? ProjectColors.mainActiveColor : ProjectColors.orange, 
            fontWeight: FontWeight.w900),),
        ClipRRect(
          borderRadius: BorderRadius.circular(SizingConstants.cardRadius),
          child: LinearProgressIndicator(
            value: rating/100.toDouble(),
            color: !isSponsored ? ProjectColors.mainActiveColor : ProjectColors.orange,
          ),
        )
      ],
    );
  }
}