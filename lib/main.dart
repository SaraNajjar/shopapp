import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'LayOut Home/layout_home.dart';
import 'Moduels/On Boarding/on_boarding_screen.dart';
import 'Moduels/Shop Login/shop_login.dart';
import 'Network/End Point/end_point.dart';
import 'Network/Local/cache_helper.dart';
import 'Network/Remote/dio_helper.dart';
import 'Shared/Bloc Observer/bloc_observer.dart';
import 'Shared/Cubit/Login Cubit/login_cubit.dart';
import 'Shared/Cubit/Shop Cubit/shop_cubit.dart';
import 'Shared/Style/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
  bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
  Token = CacheHelper.getData(key: 'token');

  if(onBoarding != null)
  {
    if(Token != null)
    {
      widget = LayOutHome();
    }
    else
    {
      widget = ShopLogin();
    }
  }
  else
  {
    widget = OnBoardingScreen();
  }
  BlocOverrides.runZoned(
        () {
      runApp(MyApp(widget));
    },
    blocObserver: MyBlocObserver(),
  );

}
class MyApp extends StatelessWidget {

  final Widget startWidget;

  MyApp(this.startWidget);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(
          create: (BuildContext context) => LoginCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => ShopCubit()..getHomeData()..getCategorisesDate()..getFavorites()..getUserData(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        home: startWidget,
      ),
    );
  }
}

