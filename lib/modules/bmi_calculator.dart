import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bmi_cubit.dart';
import 'bmi_states.dart';

class BmiCalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BmiCubit,BmiStates>(
      listener: (context,state){},
      builder: (context,state){

        var cubit=BmiCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('BMI Calculator'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              cubit.isMale;
                             cubit.toggleGender();
                              print(cubit.isMale);
                             print('Male');
                            },
                            child: Container(
                              decoration:  BoxDecoration(
                                color: cubit.isMale? Colors.blue:Colors.black12,
                               borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.male,size: 100,),
                                  Text('Male' ,style:TextStyle(fontWeight: FontWeight.bold,fontSize: 24)
                                  )],
                              ),

                            ),
                          ),
                        ),
                        const SizedBox(width: 10,),
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                              cubit.toggleGender();
                              print('Female');
                            },
                            child: Container(
                              decoration:  BoxDecoration(
                                  color: cubit.isMale? Colors.black12:Colors.blue,
                                borderRadius: BorderRadius.all(Radius.circular(20))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(Icons.female,size: 100,),
                                  Text('Female',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),)
                                ],
                              ),

                            ),
                          ),
                        ),
                      ],
                  ),
                ),
                SizedBox(height: 20,),
                Expanded(child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text('HEIGHT',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(text: '${cubit.height.round()}',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 40)),
                            const TextSpan(text: 'CM',style: TextStyle(fontWeight: FontWeight.bold)),
                          ]
                        ),),
                      Slider(value: cubit.height ,min: 80,max: 220, onChanged: (value){
                        cubit.changeSlider(value);
                      })
                    ],
                  ),
                )),
                SizedBox(height: 20,),
                Expanded(child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('WEIGHT',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600),),
                            TextButton(
                                onPressed: (){
                                },
                                child: Text('${cubit.weight}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24,color: Colors.black),)),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(onPressed: (){
                                  cubit.changeMinus();
                                }, icon: CircleAvatar(child: Icon(Icons.minimize_outlined))),
                                SizedBox(), 
                                IconButton(onPressed: (){
                                  cubit.changePlus();
                                }, icon: CircleAvatar(child: Icon(Icons.add)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(  
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                        ),
                        child: Column(
                          mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Text('AGE',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600)),
                            Text('${cubit.age}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                            Row(

                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [ 
                                IconButton(onPressed: (){
                                  cubit.changeMinusAge();
                                }, icon: CircleAvatar(child: Icon(Icons.minimize_outlined))),
                                SizedBox(),
                                IconButton(onPressed: (){
                                  cubit.changePlusAge();
                                }, icon: CircleAvatar(child: Icon  (Icons.add)))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],

                )),
                SizedBox(height: 10,),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: MaterialButton(onPressed: (){
                          cubit.calcResult();
                          showDialog(context: context, builder: (context) =>AlertDialog(
                            title: Text('BMI Result'),
                            content:Text('${cubit.result.round()}') ,
                            actions: [
                              OutlinedButton(onPressed: (){
                                Navigator.pop(context);
                              }, child: Text("Done"))
                            ],
                          ) );
                        },child: Text('Calculate',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),))
                  ],
                ),
              ],
            ),
          )
          // Column(
          //   children: [
          //     Expanded(
          //       child: Padding(
          //         padding: const EdgeInsets.all(20.0),
          //         child: Row(
          //           children: [
          //             Expanded(
          //               child: GestureDetector(
          //                 onTap: () {
          //                     cubit.toggleGender();
          //                 },
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(15),
          //                       color: cubit.isMale ? Colors.red : Colors.blueGrey),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: const [
          //                       Icon(
          //                         Icons.male,
          //                         size: 100,
          //                       ),
          //                       Text(
          //                         'MALE',
          //                         style: TextStyle(fontWeight: FontWeight.bold),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(
          //               width: 20,
          //             ),
          //             Expanded(
          //               child: GestureDetector(
          //                 onTap: () {
          //                   cubit.toggleGender();
          //                 },
          //                 child: Container(
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(15),
          //                       color: cubit.isMale ? Colors.blueGrey: Colors.blue  ),
          //                   child: Column(
          //                     mainAxisAlignment: MainAxisAlignment.center,
          //                     children: const [
          //                       Icon(
          //                         Icons.female,
          //                         size: 100,
          //                       ),
          //                       Text(
          //                         'FEMALE',
          //                         style: TextStyle(fontWeight: FontWeight.bold),
          //                       )
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ), //1st
          //     // Expanded(
          //     //   child: Padding(
          //     //     padding: const EdgeInsets.symmetric(horizontal: 20.0),
          //     //     child: Container(
          //     //       width: double.infinity,
          //     //       decoration: BoxDecoration(
          //     //           borderRadius: BorderRadius.circular(15),
          //     //           color: Colors.blueGrey),
          //     //       child: Column(
          //     //         mainAxisAlignment: MainAxisAlignment.center,
          //     //         children: [
          //     //           const Text(
          //     //             'HEIGHT',
          //     //             style:
          //     //             TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          //     //           ),
          //     //           Row(
          //     //             mainAxisAlignment: MainAxisAlignment.center,
          //     //             crossAxisAlignment: CrossAxisAlignment.baseline,
          //     //             textBaseline: TextBaseline.alphabetic,
          //     //             children: [
          //     //               Text(
          //     //                 '${height.round()}',
          //     //                 style: const TextStyle(
          //     //                     fontWeight: FontWeight.bold, fontSize: 50),
          //     //               ),
          //     //               const Text(
          //     //                 'CM',
          //     //                 style: TextStyle(fontWeight: FontWeight.bold),
          //     //               ),
          //     //             ],
          //     //           ),
          //     //           Slider(
          //     //               value: height,
          //     //               min: 80,
          //     //               max: 220,
          //     //               onChanged: (value) {
          //     //                 setState(() {
          //     //                   height = value;
          //     //                 });
          //     //               }),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ), //2nd
          //     // Expanded(
          //     //   child: Padding(
          //     //     padding: const EdgeInsets.all(20.0),
          //     //     child: Container(
          //     //       width: double.infinity,
          //     //       child: Row(
          //     //         children: [
          //     //           Expanded(
          //     //             child: Container(
          //     //               decoration: BoxDecoration(
          //     //                   borderRadius: BorderRadius.circular(15),
          //     //                   color: Colors.blueGrey),
          //     //               child: Column(
          //     //                 mainAxisAlignment: MainAxisAlignment.center,
          //     //                 children: [
          //     //                   Text(
          //     //                     'AGE',
          //     //                     style: TextStyle(
          //     //                         fontWeight: FontWeight.bold, fontSize: 25),
          //     //                   ),
          //     //                   Text(
          //     //                     '${age}',
          //     //                     style: TextStyle(
          //     //                         fontWeight: FontWeight.bold, fontSize: 50),
          //     //                   ),
          //     //                   Row(
          //     //                     mainAxisAlignment: MainAxisAlignment.center,
          //     //                     children: [
          //     //                       FloatingActionButton(
          //     //                         onPressed: () {
          //     //                           setState(() {
          //     //                             age--;
          //     //                           });
          //     //                         },
          //     //                         heroTag: 'age-',
          //     //                         mini: true,
          //     //                         child: Icon(Icons.remove),
          //     //                       ),
          //     //                       FloatingActionButton(
          //     //                         onPressed: () {
          //     //                           setState(() {
          //     //                             age++;
          //     //                           });
          //     //                         },
          //     //                         heroTag: 'age+',
          //     //                         mini: true,
          //     //                         child: Icon(Icons.add),
          //     //                       )
          //     //                     ],
          //     //                   )
          //     //                 ],
          //     //               ),
          //     //             ),
          //     //           ),
          //     //           SizedBox(
          //     //             width: 10,
          //     //           ),
          //     //           Expanded(
          //     //             child: Container(
          //     //               decoration: BoxDecoration(
          //     //                   borderRadius: BorderRadius.circular(15),
          //     //                   color: Colors.blueGrey),
          //     //               child: Column(
          //     //                 mainAxisAlignment: MainAxisAlignment.center,
          //     //                 children: [
          //     //                   Text(
          //     //                     'Weight',
          //     //                     style: TextStyle(
          //     //                         fontWeight: FontWeight.bold, fontSize: 25),
          //     //                   ),
          //     //                   Text(
          //     //                     '${Weight}',
          //     //                     style: TextStyle(
          //     //                         fontWeight: FontWeight.bold, fontSize: 50),
          //     //                   ),
          //     //                   Row(
          //     //                     mainAxisAlignment: MainAxisAlignment.center,
          //     //                     children: [
          //     //                       FloatingActionButton(
          //     //                         onPressed: () {
          //     //                           setState(() {
          //     //                             Weight--;
          //     //                           });
          //     //
          //     //                         },
          //     //                         heroTag: 'Weight-',
          //     //                         mini: true,
          //     //                         child: Icon(Icons.remove),
          //     //                       ),
          //     //                       FloatingActionButton(
          //     //                         onPressed: () {
          //     //                           setState(() {
          //     //                             Weight++;
          //     //                           });
          //     //                         },
          //     //                         heroTag: 'Weight+',
          //     //                         mini: true,
          //     //                         child: Icon(Icons.add),
          //     //                       )
          //     //                     ],
          //     //                   )
          //     //                 ],
          //     //               ),
          //     //             ),
          //     //           ),
          //     //         ],
          //     //       ),
          //     //     ),
          //     //   ),
          //     // ), //3rd
          //     // Container(
          //     //   width: double.infinity,
          //     //   color: Colors.blue,
          //     //   child: MaterialButton(
          //     //     height:10,
          //     //     onPressed: () {
          //     //       var result = Weight / pow(height / 100, 2);
          //     //     },
          //     //     child: const Text(
          //     //       'Calculate',
          //     //       style: TextStyle(
          //     //           fontWeight: FontWeight.bold,
          //     //           color: Colors.white,
          //     //           fontSize: 20),
          //     //     ),
          //     //   ),
          //     // ) //Button
          //   ],
          // ),
        );
      },
    );
  }
}
