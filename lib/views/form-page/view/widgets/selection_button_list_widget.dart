
import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/design_constants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/project_colors.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/model/form_button_model.dart';

class SelectionButtonList extends StatelessWidget {
  const SelectionButtonList({
    super.key,
    required this.buttonList,
    required this.isOrderedList
  });

  final double buttonHeight = 40;
  final List<FormButtonModel> buttonList;
  final bool isOrderedList;

  final double sequenceCotainerSize = 20;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: buttonList.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: SizingConstants.horizontalPadding),
        itemBuilder: (context, index) {
          return SizedBox(
            height: buttonHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Material(
                        borderRadius: BorderRadius.circular(SizingConstants.inputButtonBorderRadius),
                        child: InkWell(
                          borderRadius: BorderRadius.circular(SizingConstants.inputButtonBorderRadius),
                          onTap: buttonList[index].onPressed,
                          child: Ink(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(SizingConstants.inputButtonBorderRadius),
                              color: buttonList[index].isSelected ? ProjectColors.mainBlue : ProjectColors.mainGrey,
                              border: DesignConstants.defaultGreyBorder
                            ),
                            child: Center(child: Text(buttonList[index].text, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: buttonList[index].isSelected ? ProjectColors.pureWhite : ProjectColors.mainBlue),)),
                          ),
                        ),
                      ),
                      if(isOrderedList && buttonList[index].isSelected) ...[
                        Positioned(
                          right: -5,
                          top: -5,
                          child: Container(
                            width: sequenceCotainerSize,
                            height: sequenceCotainerSize,
                            decoration: BoxDecoration(color: ProjectColors.mainActiveColor, shape: BoxShape.circle, border: Border.all(width: 1, color: ProjectColors.pureWhite)),
                            child: Center(child: Text(buttonList[index].sequence.toString(), style: Theme.of(context).textTheme.bodySmall?.copyWith(color: ProjectColors.pureWhite),)),
                          ),
                        ),
                      ]
                    ],
                  ),
                ),
              ],
            ),
          );
        },
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 50,
          crossAxisSpacing: SizingConstants.horizontalPadding,
          mainAxisSpacing: SizingConstants.verticalPadding
        ) ,
      ),
    );
  }
}
