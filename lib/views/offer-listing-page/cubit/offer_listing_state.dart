part of 'offer_listing_cubit.dart';

@immutable
sealed class OfferListingState extends Equatable {
  const OfferListingState();
  
}

final class OfferListingInitial extends OfferListingState {
  const OfferListingInitial();
  
  @override
  List<Object?> get props => throw UnimplementedError();
}

final class OfferListingLoading extends OfferListingState {
  const OfferListingLoading();
  
  @override
  List<Object?> get props => [];
}

final class OfferListingCompleted extends OfferListingState {
  OfferListingCompleted({
    List<Offer>? offerList,
  }) : offerList = offerList ?? [];

  final List<Offer> offerList;
  
  @override
  List<Object?> get props => [];
}