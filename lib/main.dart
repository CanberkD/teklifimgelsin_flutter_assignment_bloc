import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/core/theme/theme.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/navigation/route_names.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/product/constants/navigation/routes.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/repository/locator.dart';
import 'package:teklifimgelsin_flutter_assignment_bloc/views/form-page/cubit/form_page_cubit.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FormPageCubit(),
      child: MaterialApp(
        theme: ProjectTheme(themeMode: ProjectThemeMode.light).themeData,
        routes: NavigationRoutes().routes,
        initialRoute: ProjectRoutes.formPage.name,
      ),
    );
  }
}
