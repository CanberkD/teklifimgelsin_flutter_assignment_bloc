import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/project_colors.dart';

class BottomBackAndContinueButtons extends StatelessWidget {
  const BottomBackAndContinueButtons({
    super.key,
    required this.isFirstPage,
    required this.isLastPage,
    required this.isContinueActive,
    required this.continueClicked,
    required this.goBackClicked
  });

  final bool isFirstPage;
  final bool isLastPage;
  final bool isContinueActive;
  final Function() continueClicked;
  final Function() goBackClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
              horizontal: SizingConstants.horizontalPadding) +
          const EdgeInsets.only(bottom: SizingConstants.verticalPadding),
      child: Row(
        children: [
          Expanded(
              flex: 0,
              child: AnimatedSize(
                  clipBehavior: Clip.hardEdge,
                  duration: const Duration(milliseconds: 200),
                    child: Visibility(
                      visible: !isFirstPage,
                      child: ElevatedButton(
                        onPressed: goBackClicked,
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ProjectColors.inactiveGrey),
                        child: const FittedBox(
                            child: Icon(Icons.chevron_left)),
                      ),
                    ),
                  )),
          Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.only(
                    left: !isFirstPage ? SizingConstants.verticalPadding : 0),
                child: ElevatedButton(
                    onPressed: isContinueActive ? continueClicked : null,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(isLastPage ? 'TeklifimGelsin' : 'Devam Et'),
                        const Icon(Icons.chevron_right)
                      ],
                    )),
              )),
        ],
      ),
    );
  }
}
