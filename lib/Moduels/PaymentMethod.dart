import 'package:flutter/material.dart';

import '../LayOut Home/layout_home.dart';
import '../Shared/Components/components.dart';

class PaymentMethod extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Mathod',style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          top: 30
        ),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                NavigatorTo(context, LayOutHome());

              },
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10
                ),
                child: Card(
                  elevation: 2,
                  child: Row(
                    children: [
                      Image(
                        width: 100,
                          height: 100,
                          image:AssetImage('assets/images/paypal.png')),
                      SizedBox(width: 5,),
                      Text('Pay Pal', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10
              ),
              child: Card(
                elevation: 2,
                child: GestureDetector(
                  onTap: (){
                    NavigatorTo(context, LayOutHome());
                  },
                  child: Row(
                    children: [
                      Image(
                          width: 100,
                          height: 100,
                          image:AssetImage('assets/images/visa4.png')),
                      SizedBox(width: 5,),
                      Text('VisaCard', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  bottom: 10
              ),
              child: GestureDetector(
                onTap: (){
                  NavigatorTo(context, LayOutHome());
                },
                child: Card(
                  elevation: 2,
                  child: Row(
                    children: [
                      Image(
                          width: 100,
                          height: 100,
                          image:AssetImage('assets/images/credit-card.png')),
                      SizedBox(width: 5,),
                      Text('CreditCard', style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold,color: Colors.black),)
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(8)
                ),
                child: MaterialButton(
                  onPressed:(){},
                  child: Text('Done', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
