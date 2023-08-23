import 'package:flutter/material.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/navigation/route_names.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/view/form_page_view.dart';

class NavigationRoutes{
  final Map<String, Widget Function(BuildContext)> routes = {   
    ProjectRoutes.formPage.name : (context) => const FormPageView(),        
  };
}