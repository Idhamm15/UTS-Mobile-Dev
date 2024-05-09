import 'package:ucommerce_apps/bloc/product/bloc/product_bloc.dart';
import 'package:ucommerce_apps/data/repository/api_repository.dart';
import 'package:ucommerce_apps/data/service/data_repository.dart';
import 'package:ucommerce_apps/presentation/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ucommerce_apps/presentation/screen/login_screen.dart';


void main() {
  runApp(MyApp(
    dataService: DataService(),
  ));
}

class MyApp extends StatelessWidget {
  final DataService dataService;
  const MyApp({super.key, required this.dataService}) : super();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc Api',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => ProductBloc(
            apiRepository: ApiRepository(dataService: dataService),
          )..add(LoadProductEvent()),
          child: HomeScreen(),
        ));
  }
}
