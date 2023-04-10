
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';

import '../../../Network/End Point/end_point.dart';
import '../../../Network/Local/cache_helper.dart';
import '../../../Shared/Colors and Icons/colors_icons.dart';
import '../../../Shared/Components/components.dart';
import '../../../Shared/Components/constant.dart';
import '../../../Shared/Cubit/Shop Cubit/shop_cubit.dart';
import '../../../Shared/Cubit/Shop Cubit/shop_states.dart';
import '../../Contact with us/contact_with_us.dart';
import '../../FAQS Screen/faqs_screen.dart';
import '../../Profile/profile_screen.dart';
import '../../Shop Login/shop_login.dart';
import '../Cart/cart_screen.dart';


class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
      builder: (context, state)
      {

        var cubit = ShopCubit.get(context);

        return cubit.userModel == null && state is ShopLoadingUpdateUserDataState
            ?
            Center(
          child: Container(
            width: 100,
            height: 100,
            child: LiquidCircularProgressIndicator(
              borderWidth: 2,
              center: Text(
                'Loading...',
                style: TextStyle(
                    color: ColorApp.blackColor,
                    fontWeight: FontWeight.w800),
              ),
              borderColor: ColorApp.maincolor0.withOpacity(0.9),
              backgroundColor: ColorApp.whiteColor,
              value: 0.35,
            ),
          ),
        )
            :
            Scaffold(
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:
              [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 20
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius:35,
                          backgroundImage: AssetImage('assets/images/person1.jpg'),

                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:
                          [
                            Text(
                              'Hi, ${cubit.userModel?.data?.name!}',
                              style: bodyText1(context).copyWith(
                                  color: ColorApp.blackColor,
                                  fontWeight: FontWeight.bold,
                                fontSize: 20
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              '${cubit.userModel?.data?.email!}',
                              style: bodyText1(context).copyWith(
                                  color: ColorApp.greyColor,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    top: 20,
                    right: 20
                  ),
                  child: Text('Account',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                  ),),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    top: 20,
                    bottom: 20,
                    left: 8
                  ),
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          children:
                          [
                            Row(
                              children:
                              [
                                Icon(IconAPP.reorderSharp),
                                const SizedBox(width: 10),
                                Text(
                                  'My Orders',
                                  style: bodyText1(context).copyWith(
                                      color: ColorApp.blackColor,
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                                const Spacer(),
                                Arrowicon(
                                  onPressed: (){

                                    NavigatorTo(context, CartScreen());
                                  },
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 1,
                                color: ColorApp.greyColor.withOpacity(0.2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children:
                                  [

                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            InkWell(
                              onTap: ()
                              {
                                cubit.getUserData();
                                NavigatorTo(context, ProfileScreen());
                              },
                              child: Row(
                                children:
                                [
                                  Icon(IconAPP.accountCircleOutlined,color: Colors.black,),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Edit Profile',
                                    style: bodyText1(context).copyWith(
                                        color: ColorApp.blackColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const Spacer(),
                                  Arrowicon(
                                    onPressed: ()
                                    {
                                      cubit.getUserData();
                                      NavigatorTo(context, ProfileScreen());
                                    },
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 1,
                          color: ColorApp.greyColor.withOpacity(0.2),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 8, right: 7),
                        child: Column(
                          children:
                          [
                            InkWell(
                              onTap: ()
                              {
                                cubit.getFAQSData();
                                NavigatorTo(context, const FAQSScreen());
                              },
                              child: Row(
                                children:
                                [
                                  Icon(IconAPP.contactPhoneOutlined,color: Colors.black,),
                                  const SizedBox(width: 10),
                                  Text(
                                    'Contact with us',
                                    style: bodyText1(context).copyWith(
                                        color: ColorApp.blackColor,
                                        fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  const Spacer(),
                                  Arrowicon(
                                      onPressed: (){
                                        NavigatorTo(context, ContactWithUs());
                                      }
                                  ),

                                ],
                              ),
                            ),
                            const SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 1,
                                color: ColorApp.greyColor.withOpacity(0.2),
                              ),
                            ),
                            Row(
                              children:
                              [
                                Icon(IconAPP.contactSupportOutlined,color: Colors.black,),
                                const SizedBox(width: 10),
                                Text(
                                  'FAQs',
                                  style: bodyText1(context).copyWith(
                                    color: ColorApp.blackColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),
                                Arrowicon(
                                  onPressed:()
                                  {
                                    cubit.getFAQSData();
                                    NavigatorTo(context, const FAQSScreen());
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyDivided(color: ColorApp.greyColor.withOpacity(0.4)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: InkWell(
                          onTap: ()
                          {
                            signOut(context);
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: ColorApp.greyColor.withOpacity(0.2),
                            ),

                            height: 45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                Text(
                                  'Sign Out',
                                  style: TextStyle(
                                      color: ColorApp.blackColor,
                                      fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}


void signOut (context)
{
  CacheHelper.removeData(key: 'token');
  Token =null;
  var model = ShopCubit.get(context).userModel;
  model!.data!.name = '';
  model.data!.email = '';
  model.data!.phone = '';
  NavigateAnfFinish(context, ShopLogin());
  ShopCubit.get(context).currentIndex =0;
}

Widget Arrowicon({required Function()? onPressed}) => IconButton(
  onPressed: onPressed,
  icon: Icon(
    IconAPP.arrowIcon,
    size: 19,
    color: ColorApp.blackColor.withOpacity(0.7),
  ),
  padding: EdgeInsets.zero,
);

