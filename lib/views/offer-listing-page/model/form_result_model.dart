// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/model/form_button_model.dart';

class FormResultModel {
  int age;
  List<FormButtonModel> spendingHabitsList;
  List<FormButtonModel> expectationsList;
  FormResultModel({
    required this.age,
    required this.spendingHabitsList,
    required this.expectationsList,
  });
  
}
