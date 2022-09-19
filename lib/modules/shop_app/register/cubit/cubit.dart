// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/models/shop_model/login_model.dart';
import 'package:i_am_rich/modules/shop_app/login/cubit/states.dart';
import 'package:i_am_rich/modules/shop_app/register/cubit/states.dart';
import 'package:i_am_rich/shared/network/end_points.dart';
import 'package:i_am_rich/shared/network/remote/dio_helper.dart';

class ShopRegisterCubit extends Cubit<ShopRegisterStates> {
  ShopRegisterCubit() : super(ShopRegisterInitialState());

  static ShopRegisterCubit get(context) => BlocProvider.of(context);
  ShopLoginModel? loginModel;

  void userRegister({
    required String name,
    required String email,
    required String password,
    required String phone,
}){
    emit(ShopRegisterLoadingState());
    DioHelper.postData(
      url: REGISTER,
      data: {
        'name' :name,
        'email' :email,
        'password' : password,
        'phone' : phone,
      },
    ).then((value){
      loginModel = ShopLoginModel.formJason(value.data);
      emit(ShopRegisterSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopRegisterErrorState(error));
    });

  }
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword =true;
  void changeSuffixIcon(){
    isPassword = !isPassword;
    suffixIcon =isPassword ? Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(ShopRegisterPasswordVisibilityState());

  }
}
