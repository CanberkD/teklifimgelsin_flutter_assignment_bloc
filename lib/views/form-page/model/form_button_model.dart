// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/enums/button_list_items.dart';

class FormButtonModel{
  ButtonListItems id;
  String text;
  int sequence;
  bool isSelected;
  Function() onPressed;
  FormButtonModel({
    required this.id,
    required this.text,
    required this.sequence,
    required this.isSelected,
    required this.onPressed,
  });

}
