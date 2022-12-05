
import 'package:bmi/shared/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import 'modules/bmi_calculator.dart';
import 'modules/bmi_cubit.dart';

void main() {
  ///test
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=>BmiCubit(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  BmiCalculator(),
      ),
    );
  }
}

