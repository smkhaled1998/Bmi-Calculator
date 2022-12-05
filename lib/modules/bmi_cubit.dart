import 'dart:math';


import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_states.dart';

class BmiCubit extends Cubit<BmiStates>{
  BmiCubit () : super (BmiInitialState());

  static BmiCubit get(context)=>BlocProvider.of(context);


  bool isMale = true;
  void toggleGender (){
    isMale = !isMale;
    print(isMale);
    emit(BmiToggleGenderState()
    );
  }

  double height =200;
  void changeSlider (double value){
    height=value;
    print(value.round());
    emit(BmiChangeHeightState()
    );
  }

  int weight = 40;
  void changePlus (){
    weight++;
    emit(BmiIncreaseWeightState());
  }
  void changeMinus (){
    weight--;
    emit(BmiDecreaseWeightState());
  }

  int age = 20;
  void changePlusAge (){
    age++;
    emit(BmiIncreaseAgeState());
  }
  void changeMinusAge (){
    age--;
    emit(BmiDecreaseAgeState());
  }

  double result=0;
  void calcResult(){
    result = weight /pow(height/100,2);
    emit(BmiResultState());
  }


}