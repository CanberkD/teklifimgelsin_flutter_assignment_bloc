import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/design_constants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/theme/project_colors.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/cubit/form_page_cubit.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/view/widgets/selection_button_list_widget.dart';

import 'widgets/bottom_back_and_continue_buttons.dart';

class FormPageView extends StatelessWidget {
  const FormPageView({super.key});

  final double containerHeight = 300;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => FormPageCubit(),
        child: Scaffold(
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: SizingConstants.horizontalPadding),
              child: Container(
                decoration: BoxDecoration(
                    color: ProjectColors.pureWhite,
                    borderRadius:
                        BorderRadius.circular(SizingConstants.cardRadius),
                    border: DesignConstants.defaultGreyBorder),
                child: SizedBox(
                  height: containerHeight,
                  child: BlocBuilder<FormPageCubit, FormPageState>(
                    builder: (context, state) {
                      if(state is FormPageInitial){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      else if(state is FormPageLoading){
                        return const Center(child: CircularProgressIndicator(),);
                      }
                      if(state is FormPageCompleted){
                        return Column(
                          children: [
                            Expanded(
                                flex: 1,
                                child: Center(
                                  child: Text(
                                    state.titleList[state.currentPageIndex],
                                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                  )
                                )
                              ),
                            Expanded(
                                flex: 5,
                                child: PageView(
                                  physics: const NeverScrollableScrollPhysics(),
                                  onPageChanged: (value) => context.read<FormPageCubit>().onPageChanged(value),
                                  controller: context.read<FormPageCubit>().pageController,
                                  children: [
                                    SelectionButtonList(
                                      buttonList: state.ageButtonList,
                                      isOrderedList: false,
                                    ),
                                    SelectionButtonList(
                                      buttonList: state.spendingHabitList,
                                      isOrderedList: true,
                                    ),
                                    SelectionButtonList(
                                      buttonList: state.expectationList,
                                      isOrderedList: true,
                                    ),
                                  ],
                                )),
                            DotsIndicator(
                              dotsCount: state.titleList.length,
                              position: state.currentPageIndex,
                              decorator: DotsDecorator(
                                size: const Size.square(9.0),
                                activeSize: const Size(18.0, 9.0),
                                activeColor: ProjectColors.mainActiveColor,
                                activeShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0)),
                              ),
                            ),
                            BottomBackAndContinueButtons(
                              isFirstPage: state.currentPageIndex == 0 ? true : false,
                              isLastPage: state.currentPageIndex == (state.titleList.length)  - 1 ? true : false,
                              isContinueActive: state.isContinueButtonActive,
                              continueClicked: (){context.read<FormPageCubit>().continueClicked(context);} ,
                              goBackClicked: (){context.read<FormPageCubit>().goBackClicked();} ,
                            )
                          ],
                        );
                      }
                      else{
                        return Container();
                      }
                    },
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
