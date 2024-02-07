import 'package:flutter/material.dart';
import 'package:flutter_assignment/presentation/utils/app_colors.dart';
import 'package:flutter_assignment/routes/router.dart';

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
  
        initialRoute: AppRouter.initial,
         onGenerateRoute: AppRouter.onGenerateRoute,
        title: 'Gem Store',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors().primaryColor,
          fontFamily: 'ProductSans',
        ));
  }
}
