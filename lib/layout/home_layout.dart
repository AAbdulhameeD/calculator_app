import 'package:calculator_app/shared/components/components.dart';
import 'package:calculator_app/shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';

class HomeLayout extends StatelessWidget {
  var textFormController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CalculatorCubit, CalculatorStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return  Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                IconBroken.Arrow___Left_2,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Text(
              'Calculator App',
              style: TextStyle(fontSize: 20.0),
            ),
            actions: [
              IconButton(onPressed: (){
                CalculatorCubit.get(context).changeAppMode();
              }, icon: Icon(Icons.brightness_4_sharp,))
            ],

            titleSpacing: 2.0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Padding(
                      padding: const EdgeInsets.all( 20.0),
                      child: Text(
                        "${CalculatorCubit.get(context).result}",textAlign: TextAlign.end,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                defaultOutlineButton(context:context,flex :2,text: 'c', onPressed: (){
                                  CalculatorCubit.get(context).calculatorClear();
                                },),
                                defaultOutlineButton(context:context,flex:1,text: '%', onPressed: (){
                                  CalculatorCubit.get(context).operatorPressed('%');
                                }),
                                defaultOutlineButton(context:context,flex:1,text: '/', onPressed: (){
                                  CalculatorCubit.get(context).operatorPressed('/');
                                }),

                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                defaultOutlineButton(context:context,text: '7', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('7');
                                }),
                                defaultOutlineButton(context:context,text: '8', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('8');
                                }),
                                defaultOutlineButton(context:context,text: '9', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('9');
                                }),
                                defaultOutlineButton(context:context,text: 'x', onPressed: (){
                                  CalculatorCubit.get(context).operatorPressed('x');

                                }),

                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                defaultOutlineButton(context:context,text: '4', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('4');
                                }),
                                defaultOutlineButton(context:context,text: '5', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('5');
                                }),
                                defaultOutlineButton(context:context,text: '6', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('6');
                                }),
                                defaultOutlineButton(context:context,text: '-', onPressed: (){
                                  CalculatorCubit.get(context).operatorPressed('-');

                                }),

                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                defaultOutlineButton(context:context,text: '1', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('1');

                                }),
                                defaultOutlineButton(context:context,text: '2', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('2');

                                }),
                                defaultOutlineButton(context:context,text: '3', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('3');

                                }),
                                defaultOutlineButton(context:context,text: '+', onPressed: (){
                                  CalculatorCubit.get(context).operatorPressed('+');

                                }),

                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                defaultOutlineButton(context:context,text: '0', onPressed: (){
                                  CalculatorCubit.get(context).numberPressed('0');

                                },flex: 2),
                                defaultOutlineButton(context:context,text: '=', onPressed: (){
                                  CalculatorCubit.get(context).calculate();
                                  CalculatorCubit.get(context).operatorPressed('=');
                                },flex: 2),

                              ],
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
