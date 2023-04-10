
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../LayOut Home/layout_home.dart';
import '../../Network/End Point/end_point.dart';
import '../../Network/Local/cache_helper.dart';
import '../../Shared/Colors and Icons/colors_icons.dart';
import '../../Shared/Components/Toast Components/toast_components.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Cubit/Login Cubit/login_cubit.dart';
import '../../Shared/Cubit/Login Cubit/login_states.dart';
import '../Register/register_screen.dart';

class ShopLogin extends StatelessWidget {

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginStates>(
      listener: (context, state)
      {
        if(state is LoginSuccessState)
        {
          if(state.loginModel.status!)
          {
            CacheHelper.saveData(
                key: 'token',
                value: state.loginModel.data!.token
            ).then((value)
            {
              Token = state.loginModel.data!.token;
              NavigateAnfFinish(context, LayOutHome());

            });
          }
          else
          {
            // toast(
            //   message: state.loginModel.message!,
            //   state: ToastState.ERROR,
            //   context: context,
            // );
          }
        }
      },
      builder: (context, state)
      {

        var cubit = LoginCubit.get(context);

        return Scaffold(
          body:
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage('assets/images/logo.png'),width: 200,height: 200,),
                       SizedBox(
                         height: 10,
                       ),
                        Center(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Form(
                            key: formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:
                              [
                                Text(
                                  'LOG IN',
                                  style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w900,
                                    color: ColorApp.maincolor0,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                D_TextFromField(
                                    controller: emailController,
                                    label: 'Email Address',
                                    labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                                    prefixIcon: IconAPP.emailIcon,
                                    prefixIconColor: Colors.black,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value)
                                    {
                                      if(value!.isEmpty){return 'Email Address not be Empty';}
                                    }
                                ),
                                const SizedBox(height: 15),
                                D_TextFromField(
                                  controller: passwordController,
                                  label: 'Password',
                                  labelStyle: const TextStyle(fontWeight: FontWeight.w600),
                                  prefixIcon: IconAPP.lockIcon,
                                    prefixIconColor: Colors.black,
                                  keyboardType: TextInputType.visiblePassword,
                                  validator: (value)
                                  {
                                    if(value!.isEmpty){return 'inCorrect Password';}
                                  },
                                  suffixIcon: cubit.suffixIcon,
                                  suffixPressed: ()
                                  {
                                    cubit.changeVisibilityIcon();
                                  },
                                  isobscureText: cubit.isVisible,
                                  onSubmitted: (value)
                                  {
                                    cubit.UserLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                ),
                                const SizedBox(height: 30),
                                ConditionalBuilder(
                                  condition: state is! LoginLoadingState,
                                  builder: (context) =>D_MaterialButton(
                                      onPressed: ()
                                      {
                                        if(formKey.currentState!.validate())
                                        {
                                          cubit.UserLogin(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          );
                                        }
                                      },
                                      isUpperCase: true,
                                      text: 'LOG IN',
                                      width: double.infinity,
                                      backgroundColorButton: ColorApp.maincolor0
                                  ),
                                  fallback: (context) => const Center(child: CircularProgressIndicator(),),
                                ),
                                const SizedBox(height: 15),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:
                                  [
                                    const Text(
                                      'Don\'t have an Account?',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    D_TextButton(
                                        onPressed: ()
                                        {
                                          NavigatorTo(context, RegisterScreen());
                                        },
                                        text: 'Register Now!',
                                        fontWeight: FontWeight.w800,
                                        color: ColorApp.maincolor0


                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ]
                    ),
                  ),
                ),
              ),
        );
      },
    );
  }
}
