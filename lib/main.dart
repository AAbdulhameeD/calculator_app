import 'package:calculator_app/shared/network/local/cache_helper.dart';
import 'package:calculator_app/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/cubit/cubit.dart';
import 'layout/cubit/states.dart';
import 'layout/home_layout.dart';

///Simple Calculator App.
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit()..getAppMode(),
      child: BlocConsumer<CalculatorCubit, CalculatorStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
                theme: lightTheme,
                themeMode: CalculatorCubit.get(context).isDarkMode ? ThemeMode.dark :ThemeMode.light,
                darkTheme:darkTheme ,
                debugShowCheckedModeBanner: false,
                home: HomeLayout());
          }),
    );
  }
}
