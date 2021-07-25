import 'package:bloc/bloc.dart';
import 'package:calculator_app/layout/cubit/states.dart';
import 'package:calculator_app/shared/network/local/cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CalculatorCubit extends Cubit<CalculatorStates> {
  CalculatorCubit() : super(InitialCalculatorHomeState());

  static CalculatorCubit get(context) => BlocProvider.of(context);
  String? result = '';
  String? finalResult = '';
  double? firstNumber = 0;
  double? secondNumber = 0;
  String? secondNumberString = '';
  String? message = '';
  String? operator = '';
  String? preOperator = '';
  bool? isNumPressed = false;
  bool? isCalculated = false;
  bool? isFirstOperation = true;
  late bool isDarkMode ;

  void changeAppMode(){
    isDarkMode=!isDarkMode;
    CacheHelper.putData(key: 'isDark', value: isDarkMode);
     print('changed$isDarkMode');

    emit(ChangeAppModeState());

  }
  void getAppMode(){
    isDarkMode= CacheHelper.getData(key: 'isDark');
    emit(ChangeAppModeState());

  }
  // if(isDark !=null){
  // isDarkMode= !isDark;}
  // CacheHelper.putData(key: 'isDark', value: isDarkMode);
  // print('changed$isDarkMode');
  // emit(ChangeAppModeState());
  void calculatorClear() {
    result = '';
    finalResult = '';
    firstNumber = 0;
    secondNumber = 0;
    secondNumberString = '';
    operator = '';
    preOperator = '';
    isNumPressed = false;
    isFirstOperation = true;
    isCalculated = false;
    emit(CalculatorClearState());
  }

  void numberPressed(String num) {
    isNumPressed = true;
    if (isFirstOperation == true&&operator=="=") {
      result='';
      secondNumberString = '';
      firstNumber = 0;
      finalResult = '';
    }
    if (result == "" || operator == '') {
      result = result! + num;
      isCalculated = false;
    } else if (operator != '') {
      print('operator  :$operator');

      secondNumberString = secondNumberString! + num;
      secondNumber = double.parse(secondNumberString!);
      result = result! + num;
      isNumPressed = false;
      print('second num :$secondNumber');
    } else if (finalResult != '') {
      finalResult = '';
      secondNumberString = '';
      result = '';
      result = result! + num;
      firstNumber = 0;
      secondNumber = 0;
    }

    emit(ChangeResultState());
  }

  void operatorPressed(String operatorFunc) {
    if (operatorFunc == '=') {
      operator = operatorFunc;
      isFirstOperation = true;
    } else {
      if (isNumPressed == false) {
        if (operator != '') {
          preOperator=operator;
          print('preOperator :$preOperator');

          if (operator == '=') {
            isCalculated = false;
            operator=operatorFunc;
            isFirstOperation = false;
            print('operator :$operator');
            print('operator :$firstNumber');
            print('operator :$secondNumber');
            print('operator :$finalResult');
            print('operator :$isFirstOperation');
            firstNumber = double.parse(finalResult!);

            result=finalResult!+operator!;




          }
          if (isCalculated == true) {
            print('already calculated');
            print('operator :$operator');
            return;
          } else {
            print('calculating...');
            print('operator first num again:$firstNumber');
            print('operator second num again :$secondNumber');


            if(preOperator !='='){
            calculate();}
            firstNumber = double.parse(finalResult!);
            isFirstOperation = false;
            secondNumberString = '';
            operator = '';
            isCalculated = false;
            operator = operatorFunc;
            result = finalResult! + operatorFunc;
          }
        }
      } else {
        operator = operatorFunc;

        if (isFirstOperation == true) {
          isFirstOperation = false;
          firstNumber = double.parse(result!);
        }

        print('first num :$firstNumber');

        result = result! + operatorFunc;
        isNumPressed = false;
      }
    }
    emit(ChangeResultState());
  }

  void calculate() {
    switch (operator) {
      case '+':
        addition(firstNumber!, secondNumber!);
        break;
      case '-':
        subtraction(firstNumber!, secondNumber!);
        break;
      case 'x':
        multiply(firstNumber!, secondNumber!);
        break;
      case '/':
        divide(firstNumber!, secondNumber!);

        break;
      case '%':
        modulus(firstNumber!, secondNumber!);

        break;
      case '=':
        print('s num $secondNumber');

        break;
    }
    result = finalResult;
    isCalculated = true;
    emit(ChangeResultState());
    firstNumber = 0;
    operator = '';
    print('calculated...');


  }

  void addition(double firstNum, double secondNum) {
    finalResult = (firstNum + secondNum).toString();
  }

  void subtraction(double firstNum, double secondNum) {
    finalResult = (firstNum - secondNum).toString();
  }

  void multiply(double firstNum, double secondNum) {
    finalResult = (firstNum * secondNum).toString();
  }

  void divide(double firstNum, double secondNum) {
    if(secondNumber ==0){
      message ='Cannot divide by 0';
      finalResult =message;
      return;
    }else{
    finalResult = (firstNum / secondNum).toString();}
  }

  void modulus(double firstNum, double secondNum) {
    finalResult = (firstNum / secondNum).toString();
  }
}
