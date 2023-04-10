import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Shared/Colors and Icons/colors_icons.dart';
import '../Shared/Cubit/Shop Cubit/shop_cubit.dart';
import '../Shared/Cubit/Shop Cubit/shop_states.dart';

class LayOutHome extends StatelessWidget {
  const LayOutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state){},
      builder:  (context, state)
      {

        var cubit = ShopCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            elevation: 2,
            title: Text(cubit.title[cubit.currentIndex],style: TextStyle(
              fontWeight: FontWeight.bold),),
            actions:
            [
              IconButton(
                  onPressed: ()
                  {
                   // NavigatorTo(context, SearchScreen());
                  },
                  icon: Icon(IconAPP.searchIcon),
              ),
            ],
          ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 55,
            backgroundColor: ColorApp.maincolor0,
            buttonBackgroundColor: ColorApp.whiteColor,
            color: ColorApp.whiteColor,
            animationCurve: Curves.fastLinearToSlowEaseIn,
            animationDuration: const Duration(milliseconds: 250),
            index: cubit.currentIndex,

            items:
            [
              Icon(
                IconAPP.homeIcon,
                color: ColorApp.maincolor0.withOpacity(0.9),
              ),
              Icon(
                IconAPP.apartmentOutlined,
                color: ColorApp.maincolor0.withOpacity(0.9),
              ),
              cubit.currentIndex == 2
                  ?
                  Icon(
                    IconAPP.favoriteIcon,
                    color: ColorApp.maincolor0.withOpacity(0.9),
                  )
                  :
                  Icon(
                    IconAPP.borderFavoriteIcon,
                    color: ColorApp.maincolor0.withOpacity(0.9),
                  ),
              Icon(
                IconAPP.personIcon,
                color: ColorApp.maincolor0.withOpacity(0.9),
              ),
            ],
            onTap: (index)
            {
              cubit.ChangeBottomScreen(index);
              if(cubit.currentIndex == 3) cubit.getUserData();
            },
          ),
        );
      },
    );
  }
}

/*
BottomNavigationBar(
            items:
            [
              BottomNavigationBarItem(
                  icon: Icon(IconAPP.homeIcon),
                  label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconAPP.appsIcon),
                label: 'Categories',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconAPP.favoriteIcon),
                label: 'Favorites',
              ),
              BottomNavigationBarItem(
                icon: Icon(IconAPP.settingsIcon),
                label: 'Settings',
              ),
            ],
            currentIndex: cubit.currentIndex,
            onTap: (index)
            {
              cubit.ChangeBottomScreen(index);
            },
          ),
 */