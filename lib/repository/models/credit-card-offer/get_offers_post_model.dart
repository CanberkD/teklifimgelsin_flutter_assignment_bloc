import 'package:teklifimgelsin_flutter_assignment_bloc/core/service/abstracts/a_service_base_model.dart';

class GetOffersPostModel extends ServiceBaseModel{
  int? age;
  int? bill;
  int? dining;
  int? grocery;
  int? installment;
  int? mile;
  int? onlineShopping;
  int? other;
  int? point;
  int? saleCashback;
  int? travel;

  GetOffersPostModel(
      {this.age,
      this.bill,
      this.dining,
      this.grocery,
      this.installment,
      this.mile,
      this.onlineShopping,
      this.other,
      this.point,
      this.saleCashback,
      this.travel});

  GetOffersPostModel.fromJson(Map<String, dynamic> json) {
    fromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['age'] = age;
    data['bill'] = bill;
    data['dining'] = dining;
    data['grocery'] = grocery;
    data['installment'] = installment;
    data['mile'] = mile;
    data['online_shopping'] = onlineShopping;
    data['other'] = other;
    data['point'] = point;
    data['sale_cashback'] = saleCashback;
    data['travel'] = travel;
    return data;
  }
  
  @override
  fromJson(Map<String, dynamic> json) {
    age = json['age'];
    bill = json['bill'];
    dining = json['dining'];
    grocery = json['grocery'];
    installment = json['installment'];
    mile = json['mile'];
    onlineShopping = json['online_shopping'];
    other = json['other'];
    point = json['point'];
    saleCashback = json['sale_cashback'];
    travel = json['travel'];
  }
}
