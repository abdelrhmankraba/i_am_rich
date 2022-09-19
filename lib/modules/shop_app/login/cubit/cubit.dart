// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/models/shop_model/login_model.dart';
import 'package:i_am_rich/modules/shop_app/login/cubit/states.dart';
import 'package:i_am_rich/shared/network/end_points.dart';
import 'package:i_am_rich/shared/network/remote/dio_helper.dart';

class ShopLoginCubit extends Cubit<ShopLoginStates> {
  ShopLoginCubit() : super(ShopLoginInitialState());

  static ShopLoginCubit get(context) => BlocProvider.of(context);


  ShopLoginModel? loginModel;

  void userLogin({
  required String email,
  required String password,
}) {
    emit(ShopLoginLoadingState());
    DioHelper.postData(
      url: LOGIN,
      data: {
        'email' :email,
        'password' : password,
      },
    ).then((value){
      loginModel = ShopLoginModel.formJason(value.data);
      emit(ShopLoginSuccessState(loginModel!));
    }).catchError((error){
      print(error.toString());
      emit(ShopLoginErrorState(error));
    });

  }
  IconData suffixIcon = Icons.visibility_outlined;
  bool isPassword =true;
  void changeSuffixIcon(){
    isPassword = !isPassword;
    suffixIcon =isPassword ? Icons.visibility_outlined :Icons.visibility_off_outlined;
    emit(ShopPasswordVisibilityState());

  }
}
