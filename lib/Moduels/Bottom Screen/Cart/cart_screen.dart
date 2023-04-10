import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../Shared/Components/components.dart';
import '../../PaymentMethod.dart';


class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              elevation: 2,
              child: Container(
                height: 100,
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/download.png'),
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [
                          Center(
                            child: Row(
                              children: [
                                Column(

                                  children: [
                                    SizedBox(height: 15,),
                                    Text(
                                        'Apple Watch',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Electronic'),
                                    Text('400\$')
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: ()
                                  {
                                    // ShopCubit.get(context).changeFavorites(favoritesData!.product!.id!);
                                  },
                                  icon:
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    color:Colors.black,
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

              SizedBox(
                height: 20,
              ),
            Card(
              elevation: 2,
              child: Container(
                height: 100,
                child: Row(
                  children: [
                    Image(
                      image: AssetImage('assets/images/ddownload4.png'),
                      width: 120,
                      height: 120,
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:
                        [

                          Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(height: 15,),
                                  Text(
                                    'Bycicle',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                                  ),
                                  SizedBox(height: 10,),
                                  Text('Electronic'),
                                  Text('100\$')
                                ],
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: ()
                                {
                                  // ShopCubit.get(context).changeFavorites(favoritesData!.product!.id!);
                                },
                                icon:
                                Icon(
                                  Icons.arrow_forward_ios_outlined,
                                  color:Colors.black,
                                  size: 20,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor('#4BD18E'),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      //NavigatorTo(context, CategoriesScreen());
                    },
                    child: Text('Add more',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ) ,
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: 155,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: HexColor('#4BD18E'),
                  ),
                  child: MaterialButton(
                    onPressed: (){
                      NavigatorTo(context, PaymentMethod());
                    },
                    child: Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ) ,
                  ),
                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:liquid_progress_indicator/liquid_progress_indicator.dart';
// import '../../../Models/Get Cart Model/get_cart_model.dart';
// import '../../../Models/Get Favorites Model/get_favorite_model.dart';
// import '../../../Shared/Colors and Icons/colors_icons.dart';
// import '../../../Shared/Components/components.dart';
// import '../../../Shared/Cubit/Shop Cubit/shop_cubit.dart';
// import '../../../Shared/Cubit/Shop Cubit/shop_states.dart';
// import '../../Products Details/product_detail_screen.dart';
//
// class CartsScreen extends StatelessWidget {
//   const CartsScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<ShopCubit, ShopStates>(
//       listener: (context, state){},
//       builder: (context, state)
//       {
//         var cubit = ShopCubit.get(context);
//
//         return cubit.cartModel == null
//             ?
//         Center(
//           child: Container(
//             width: 100,
//             height: 100,
//             child: LiquidCircularProgressIndicator(
//               borderWidth: 2,
//               center: Text(
//                 'Loading...',
//                 style: TextStyle(
//                     color: ColorApp.blackColor,
//                     fontWeight: FontWeight.w800),
//               ),
//               borderColor: ColorApp.maincolor0.withOpacity(0.9),
//               backgroundColor: ColorApp.whiteColor,
//               value: 0.35,
//             ),
//           ),
//         )
//             :
//         cubit.cartModel!.data!.data.isEmpty
//             ?
//         const Text('')
//             :
//         ListView.separated(
//           physics: const BouncingScrollPhysics(),
//           itemBuilder: (context, index) => cartBuildItem(
//             cubit.cartModel!.data!.data[index],
//             context,
//           ),
//           separatorBuilder: (context, index) => Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: MyDivided(color: ColorApp.blackColor.withOpacity(0.3)),
//           ),
//           itemCount: cubit.cartModel!.data!.data.length,
//         );
//       },
//     );
//   }
// }
//
// Widget cartBuildItem(CartData? cartData, context) => InkWell(
//   onTap: ()
//   {
//     ShopCubit.get(context).getProductDetails(cartData!.id.toString());
//     NavigatorTo(context, ProductDetails(cartData.product!.id));
//   },
//   child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//       height: 100,
//       child: Row(
//         children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomStart,
//             children:
//             [
//               Image(
//                 image: NetworkImage('${cartData?.product!.image}'),
//                 width: 120,
//                 height: 120,
//               ),
//               if(cartData?.product!.discount !=0)
//                 Container(
//                   padding: const EdgeInsets.symmetric(
//                     horizontal: 5,
//                     vertical: 2,
//                   ),
//                   color: ColorApp.redAccent,
//                   child: Text(
//                     'DISCOUNT',
//                     style: TextStyle(
//                       color: ColorApp.whiteColor,
//                       fontSize: 10,
//                     ),
//                   ),
//                 )
//             ],
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:
//               [
//                 Text(
//                   '${cartData?.product!.name}',
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                   style: const TextStyle(
//                     height: 1.3,
//                   ),
//                 ),
//                 const Spacer(),
//                 Row(
//                   children: [
//                     Text(
//                         '${cartData?.product!.price}'
//                     ),
//                     const SizedBox(width: 10),
//                     if(cartData?.product!.discount != 0)
//                       Text(
//                         '(${cartData?.product!.oldPrice})',
//                         style: TextStyle(
//                           color: ColorApp.greyColor,
//                           decoration: TextDecoration.lineThrough,
//                         ),
//                       ),
//                     const Spacer(),
//                     IconButton(
//                       onPressed: ()
//                       {
//                         ShopCubit.get(context).changeCart(cartData!.product!.id!);
//                       },
//                       icon:
//                       CircleAvatar(
//                         radius: 16,
//                         backgroundColor: ShopCubit.get(context).cart[cartData?.product!.id]!
//                             ?
//                         ColorApp.redAccent
//                             :
//                         ColorApp.greyColor.withOpacity(0.3) ,
//                         child: Icon(
//                           Icons.add_shopping_cart,
//                           color: ShopCubit.get(context).cart[cartData?.product!.id]!
//                               ?
//                           ColorApp.whiteColor
//                               :
//                           ColorApp.blackColor,
//                           size: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   ),
// );
//
//
