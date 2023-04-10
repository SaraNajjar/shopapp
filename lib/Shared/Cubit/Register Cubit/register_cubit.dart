

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingproject/Shared/Cubit/Register%20Cubit/register%20states.dart';

import '../../../Models/Login Model/login_model.dart';
import '../../../Network/End Point/end_point.dart';
import '../../../Network/Remote/dio_helper.dart';
import '../../Colors and Icons/colors_icons.dart';

class RegisterCubit extends Cubit<RegisterStates>
{

  RegisterCubit() : super(RegisterInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isVisibility = true;
  IconData suffix = IconAPP.visibilityIcon;

  void changeVisibility()
  {
    isVisibility = !isVisibility;
    suffix = isVisibility? IconAPP.visibilityIcon : IconAPP.visibilityOffIcon;
    emit(ChangeVisibilityPassword());
  }

  ShopLoginModel? registerModel;

  void UserRegister({
    required String name,
    required String email,
    required dynamic password,
    required String phone,
})
  {

    emit(RegisterLoadingState());

    DioHelper.postData(
        url: REGISTER,
        data:
        {
          'name' : name,
          'email' : email,
          'password' : password,
          'phone' : phone,
        },
    ).then((value)
    {
      registerModel = ShopLoginModel.fromJson(value.data);
      print(value.data);
      emit(RegisterSuccessState(registerModel!));
    }).catchError((onError)
    {
      print(onError.toString());
      emit(RegisterErrorState(onError.toString()));
    });
  }
}