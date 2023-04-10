import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Cubit/Shop Cubit/shop_cubit.dart';
import '../../Shared/Cubit/Shop Cubit/shop_states.dart';

class ContactWithUs extends StatelessWidget {
  const ContactWithUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
        listener: (context, state){},
        builder: (context, state){
          var cubit = ShopCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: Text('Contact with us',style: TextStyle(fontWeight: FontWeight.bold),),
              elevation: 1,
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 30,
                  right: 30,
                  top: 70
                ),
                child: Center(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width:10, color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                            ),
                          prefixIcon: Icon(Icons.person_sharp,color: Colors.black,size: 30,)
                        ),
                        initialValue: '${cubit.userModel?.data?.name!}',

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(width:10, color: Colors.grey),
                              borderRadius: BorderRadius.all(Radius.circular(10)),

                            ),
                            prefixIcon: Icon(Icons.email,color: Colors.black,size: 25)
                        ),
                        initialValue: '${cubit.userModel?.data?.email!}',

                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          maxLines: 6,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide(width: 12, color: Colors.grey),
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                              )
                          )
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.lightBlueAccent,
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: MaterialButton(
                          onPressed:(){},
                          child: Text('SEND', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white
                          ),),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

    );
  });
}}
