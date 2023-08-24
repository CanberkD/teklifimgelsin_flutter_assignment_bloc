import 'package:teklifimgelsin_flutter_assignment_bloc/core/service/abstracts/a_service_base_model.dart';

class GetOffersResponseModel extends ServiceBaseModel{
  List<Offer>? sponsoredOffers;
  List<Offer>? activeOffers;
  List<Offer>? passiveOffers;
  int? id;
  String? createdAt;

  GetOffersResponseModel(
      {this.sponsoredOffers,
      this.activeOffers,
      this.passiveOffers,
      this.id,
      this.createdAt});

  GetOffersResponseModel.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sponsoredOffers != null) {
      data['sponsored_offers'] =
          sponsoredOffers!.map((v) => v.toJson()).toList();
    }
    if (activeOffers != null) {
      data['active_offers'] =
          activeOffers!.map((v) => v.toJson()).toList();
    }
    if (passiveOffers != null) {
      data['passive_offers'] =
          passiveOffers!.map((v) => v.toJson()).toList();
    }
    data['id'] = id;
    data['created_at'] = createdAt;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    if (json['sponsored_offers'] != null) {
      sponsoredOffers = <Offer>[];
      json['sponsored_offers'].forEach((v) {
        sponsoredOffers!.add(Offer.fromJson(v));
      });
    }
    if (json['active_offers'] != null) {
      activeOffers = <Offer>[];
      json['active_offers'].forEach((v) {
        activeOffers!.add(Offer.fromJson(v));
      });
    }
    if (json['passive_offers'] != null) {
      passiveOffers = <Offer>[];
      json['passive_offers'].forEach((v) {
        passiveOffers!.add(Offer.fromJson(v));
      });
    }
    id = json['id'];
    createdAt = json['created_at'];
  }
}

class Offer {
  int? cardId;
  int? bankId;
  String? cardName;
  num? annualPayment;
  double? shoppingInterest;
  double? overdueInterest;
  double? cashAdvanceInterest;
  String? imgUrl;
  String? url;
  int? sponsored;
  bool? active;
  List<String>? campaigns;
  List<String>? categories;
  num? rating;

  Offer(
      {this.cardId,
      this.bankId,
      this.cardName,
      this.annualPayment,
      this.shoppingInterest,
      this.overdueInterest,
      this.cashAdvanceInterest,
      this.imgUrl,
      this.url,
      this.sponsored,
      this.active,
      this.campaigns,
      this.categories,
      this.rating});

  Offer.fromJson(Map<String, dynamic> json) {
    cardId = json['card_id'];
    bankId = json['bank_id'];
    cardName = json['card_name'];
    annualPayment = json['annual_payment'];
    shoppingInterest = json['shopping_interest'];
    overdueInterest = json['overdue_interest'];
    cashAdvanceInterest = json['cash_advance_interest'];
    imgUrl = json['img_url'];
    url = json['url'];
    sponsored = json['sponsored'];
    active = json['active'];
    campaigns = json['campaigns'].cast<String>();
    categories = json['categories'].cast<String>();
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['card_id'] = cardId;
    data['bank_id'] = bankId;
    data['card_name'] = cardName;
    data['annual_payment'] = annualPayment;
    data['shopping_interest'] = shoppingInterest;
    data['overdue_interest'] = overdueInterest;
    data['cash_advance_interest'] = cashAdvanceInterest;
    data['img_url'] = imgUrl;
    data['url'] = url;
    data['sponsored'] = sponsored;
    data['active'] = active;
    data['campaigns'] = campaigns;
    data['categories'] = categories;
    data['rating'] = rating;
    return data;
  }
}
