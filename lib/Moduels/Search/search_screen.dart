//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../Models/Products Details/product_details_model.dart';
// import '../../Shared/Colors and Icons/colors_icons.dart';
// import '../../Shared/Components/components.dart';
// import '../../Shared/Cubit/Search Cubit/search_cubit.dart';
// import '../../Shared/Cubit/Search Cubit/search_states.dart';
// import '../../Shared/Cubit/Shop Cubit/shop_cubit.dart';
// import '../Products Details/product_detail_screen.dart';
//
// class SearchScreen extends StatelessWidget {
//
//   var searchController = TextEditingController();
//   var formKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (BuildContext context) => SearchCubit(),
//       child: BlocConsumer<SearchCubit, SearchStates>(
//         listener: (context, state){},
//         builder: (context, state)
//         {
//           return Scaffold(
//               body: Scaffold(
//                 appBar: AppBar(
//                   title: Text('Search'),
//                   titleSpacing: 1,
//                 ),
//                 body: Form(
//                   key: formKey,
//                   child: Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       children:
//                       [
//                         D_TextFromField(
//                           controller: searchController,
//                           label: 'Search',
//                           prefixIcon: IconAPP.searchOutlined,
//                           keyboardType: TextInputType.text,
//                           onSubmitted: (text)
//                           {
//                             SearchCubit.get(context).Search(text!);
//                           },
//                           validator: (value)
//                           {
//                             if(value!.isEmpty) return 'Enter Text To Start Search';
//                           }
//                         ),
//                         const SizedBox(height: 10),
//                         if(state is SearchLoadingState)
//                           const LinearProgressIndicator(),
//                         if(state is SearchSuccessState)
//                           List(context)
//                       ],
//                     ),
//                   ),
//                 ),
//               )
//           );
//         },
//       ),
//     );
//   }
// }
//
// Widget List(context) => Expanded(
//   child: ListView.separated(
//     physics: const BouncingScrollPhysics(),
//     itemBuilder: (context, index) => searchItem(
//        SearchCubit.get(context).searchModel!.data!.data[index] , context),
//     separatorBuilder: (context, index) => Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: MyDivided(color: ColorApp.blackColor.withOpacity(0.3)),
//     ),
//     itemCount: SearchCubit.get(context).searchModel!.data!.data.length,
//   ),
// );
//
//
// Widget searchItem(ProductData productData, context) => InkWell(
//   onTap: ()
//   {
//     ShopCubit.get(context).getProductDetails(productData.id.toString());
//     NavigatorTo(context, ProductDetails(productData.id));
//   },
//   child: Padding(
//     padding: const EdgeInsets.all(20.0),
//     child: Container(
//       height: 120,
//       child: Row(
//         children: [
//           Stack(
//             alignment: AlignmentDirectional.bottomStart,
//             children:
//             [
//               Image(
//                 image: NetworkImage('${productData.image}'),
//                 width: 120,
//                 height: 120,
//               ),
//             ],
//           ),
//           const SizedBox(width: 15),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children:
//               [
//                 Text(
//                   '${productData.name}',
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
//                         '${productData.price} ILS'
//                     ),
//                     const Spacer(),
//                     Row(
//                       children: [
//                         Text(
//                             'Details'.toUpperCase(),
//                             style: TextStyle(
//                                 color: ColorApp.mainColor,
//                                 fontSize: 12
//                             ),
//                         ),
//                         const SizedBox(width: 1),
//                         Icon(
//                             IconAPP.arrowRightRounded,
//                             color: ColorApp.mainColor,
//                         )
//                       ],
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