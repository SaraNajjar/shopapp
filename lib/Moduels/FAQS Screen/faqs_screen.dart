
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../../Models/FAQS Model/faqs_model.dart';
import '../../Shared/Colors and Icons/colors_icons.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Components/constant.dart';
import '../../Shared/Cubit/Shop Cubit/shop_cubit.dart';
import '../../Shared/Cubit/Shop Cubit/shop_states.dart';

class FAQSScreen extends StatelessWidget {
  const FAQSScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
      builder: (context, state)
      {
        return Scaffold(
          appBar: AppBar(
            title: const Text('FAQs'),
          ),
          body: state is ShopLoadingFAQSState? indicator() : faqsScreen(context),
        );
      },
    );
  }
}


Widget indicator() => Center(
  child: Container(
    width: 100,
    height: 100,
    child: LiquidCircularProgressIndicator(
      borderWidth: 2,
      center: Text('Loading...' , style: TextStyle(color: ColorApp.blackColor, fontWeight: FontWeight.w800),),
      borderColor: ColorApp.maincolor0.withOpacity(0.9),
      backgroundColor: ColorApp.whiteColor,
      value: 0.35,),
  ),
);

Widget faqsScreen (context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemBuilder: (context, index) => faqsBuilder(ShopCubit.get(context).faqsModel!.data!.data![index], context),
    separatorBuilder: (context, index) => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MyDivided(color: ColorApp.blackColor, withOpacity: 0.3),
    ),
    itemCount: ShopCubit.get(context).faqsModel!.data!.data!.length,
);

Widget faqsBuilder(AQData aqData, context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child:   Container(
    color: ColorApp.greyColor.withOpacity(0.02),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
      [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            const Text(
                'Question:',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),
            ),
            Expanded(
              child: Text(
                ' ${aqData.question}',
                style: bodyText1(context).copyWith(
                    color: ColorApp.blackColor,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:
          [
            const Text(
              'Answer:',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600
              ),
            ),
            Expanded(
              child: Text(
                ' ${aqData.answer}',
                style: bodyText1(context).copyWith(
                  color: ColorApp.blackColor,
                  height: 1.3
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  ),
);