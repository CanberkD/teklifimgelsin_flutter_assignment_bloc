import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/design/sizing_contants.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/enums/arguments.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/offer-listing-page/cubit/offer_listing_cubit.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/offer-listing-page/model/form_result_model.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/offer-listing-page/view/widgets/offer_list_item.dart';

class OfferListingPageView extends StatelessWidget {
  const OfferListingPageView({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ?? <String, dynamic>{}) as Map;
    FormResultModel formResultModel = arguments[Arguments.formResultModel];
    
    return BlocProvider(
      create: (context) => OfferListingCubit(),
      child: Scaffold(
        body: BlocBuilder<OfferListingCubit, OfferListingState>(
          builder: (context, state) {
            if(state is OfferListingInitial){
              context.read<OfferListingCubit>().init(formResultModel);
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is OfferListingLoading){
              return const Center(child: CircularProgressIndicator(),);
            }
            else if(state is OfferListingCompleted){
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.offerList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: SizingConstants.horizontalPadding,
                        vertical: SizingConstants.verticalPadding),
                    child: InkWell(
                      borderRadius:
                          BorderRadius.circular(SizingConstants.cardRadius),
                      onTap: () {context.read<OfferListingCubit>().cardContainerClicked(state.offerList[index], index, context);},
                      child: Hero(
                        tag: index,
                        child: Material(
                          type: MaterialType.transparency,
                          child: OfferListItem(
                            imgUrl: state.offerList[index].imgUrl ?? 'errImgpath',
                            cardName: state.offerList[index].cardName ?? 'CardName',
                            isSponsored: state.offerList[index].sponsored == 0 ? false : true,
                            annualPayment: state.offerList[index].annualPayment?.toInt() ?? 0,
                            applyUrl: state.offerList[index].url ?? '',
                            cashAdvanceInterest: state.offerList[index].cashAdvanceInterest?.toDouble() ?? 0,
                            isExtendedCardView: false,
                            overdueInterest: state.offerList[index].overdueInterest?.toDouble() ?? 0,
                            rating: state.offerList[index].rating ?? 0,
                            shoppingInterest: state.offerList[index].shoppingInterest ?? 0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            else{
              return Container();
            }
          },
        ),
      ),
    );
  }
}
