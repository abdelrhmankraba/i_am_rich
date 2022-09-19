// ignore_for_file: avoid_print
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/models/shop_model/categories_moodel.dart';
import 'package:i_am_rich/models/shop_model/change_favorites_model.dart';
import 'package:i_am_rich/models/shop_model/category_products_model.dart';
import 'package:i_am_rich/models/shop_model/favorite_model.dart';
import 'package:i_am_rich/models/shop_model/home_model.dart';
import 'package:i_am_rich/models/shop_model/login_model.dart';
import 'package:i_am_rich/modules/shop_app/categories/categories_screen.dart';
import 'package:i_am_rich/modules/shop_app/cubit/states.dart';
import 'package:i_am_rich/modules/shop_app/favorites/favorites_screen.dart';
import 'package:i_am_rich/modules/shop_app/products/products_screen.dart';
import 'package:i_am_rich/modules/shop_app/settings/settings_screen.dart';
import 'package:i_am_rich/shared/components/constants.dart';
import 'package:i_am_rich/shared/network/end_points.dart';
import 'package:i_am_rich/shared/network/local/cache_helper.dart';
import 'package:i_am_rich/shared/network/local/cache_helper.dart';
import 'package:i_am_rich/shared/network/remote/dio_helper.dart';

import '../../../shared/network/local/cache_helper.dart';
import '../../../shared/network/local/cache_helper.dart';

class ShopCubit extends Cubit<ShopStates> {
  ShopCubit() : super(ShopInitialState());

  static ShopCubit get(context) => BlocProvider.of(context);

  List<Widget> bottomScreen = [
    const ProductsScreen(),
    const CategoriesScreen(),
    const FavoritesScreen(),
    const SettingsScreen(),
  ];
  int currentIndex = 0;

  void changeBottom(int index) {
    currentIndex = index;
    emit(ShopChangeBottomNavState());
  }
  double? numOfRating;
  double checkRating(){
    if(CacheHelper.get(key: 'rating')==null){
      numOfRating =3.0;
      return 3.0;
    }
    numOfRating =CacheHelper.get(key: 'rating');
    return CacheHelper.get(key: 'rating');
  }
  void changeRating(double num) {
    numOfRating = num;
    emit(ShopChangeBottomNavState());
  }

  HomeDataModel? homeDataModel;
  Map<int, bool> favorites = {};

  void getHomeData() {
    emit(ShopLoadingHomeDataState());
    DioHelper.getData(
      url: HOME,
      token: token,
    ).then((value) {
      emit(ShopSuccessHomeDataState());
      homeDataModel = HomeDataModel.fromJson(value.data);
      homeDataModel!.data!.products.forEach((element) {
        favorites.addAll({
          element.id!: element.inFavorites!,
        });
      });
    }).catchError((error) {
      print(error);
      emit(ShopErrorHomeDataState());
    });
  }

  CategoriesModel? categoriesModel;
  int numCategories = 0;
  void getCategories() {
    DioHelper.getData(
      url: GET_CATEGORIES,
      token: token,
    ).then((value) {
      emit(ShopSuccessCategoriesState());
      categoriesModel = CategoriesModel.fromJson(value.data);
      numCategories =categoriesModel!.data!.dataModel.length;
    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoriesState());
    });
  }

  late ChangeFavoritesModel changeFavoritesModel;
  void changeFavorites(int productId) {
    favorites[productId] = ! favorites[productId]!;
    emit(ShopFavoritesState());
    DioHelper.postData(
      url: FAVORITES,
      data: {
        'product_id' : productId,
      },
      token: token,
    ).then((value) {
      changeFavoritesModel = ChangeFavoritesModel.fromJson(value.data);
      emit(ShopSuccessChangeFavoritesState(changeFavoritesModel));
      if(!changeFavoritesModel.status!){
        favorites[productId] = ! favorites[productId]!;
      }else{
        getFavorites();
      }
    }).catchError((error) {
      favorites[productId] = ! favorites[productId]!;
      print(error.toString());
      emit(ShopErrorChangeFavoritesState());
    });
  }

  FavoriteModel? favoriteModel;
  int numFavorites = 0;
  void getFavorites() {
    emit(ShopLoadingGetFavoritesState());
    DioHelper.getData(
      url: FAVORITES,
      token: token,
    ).then((value) {
      emit(ShopSuccessGetFavoritesState());
      favoriteModel = FavoriteModel.fromJson(value.data);
      numFavorites =favoriteModel!.data!.data!.length;
    }).catchError((error) {
      print(error);
      emit(ShopErrorGetFavoritesState());
    });
  }

  ShopLoginModel? userModel;
  void getUserData() {
    emit(ShopLoadingUserDataState());
    DioHelper.getData(
      url: PROFILE,
      token: token,
    ).then((value) {
      userModel = ShopLoginModel.formJason(value.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUserDataState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorUserDataState());
    });
  }


  void updateUserData({
  required String name,
  required String email,
  required String phone,
}) {
    emit(ShopLoadingUpdateUserState());
    DioHelper.putData(
      url: UPDATEPROFILE,
      token: token,
      data:{
        'name':name,
        'email':email,
        'phone':phone,
      },
    ).then((value) {
      userModel = ShopLoginModel.formJason(value.data);
      print(userModel!.data!.name);
      emit(ShopSuccessUpdateUserState());
    }).catchError((error) {
      print(error);
      emit(ShopErrorUpdateUserState());
    });
  }


  CategoryProductsModel? electronicDeviceModel;
  void getElectronicDevices() {
    emit(ShopLoadingCategoryProductsState());
    DioHelper.getData(
      url: electronicDevices,
      token: token,
    ).then((value) {
      emit(ShopSuccessCategoryProductsState());
      electronicDeviceModel = CategoryProductsModel.fromJson(value.data);

    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoryProductsState());
    });
  }


  CategoryProductsModel? preventCorona;
  void getPreventCorona() {
    emit(ShopLoadingCategoryProductsState());
    DioHelper.getData(
      url: preventCoronaURL,
      token: token,
    ).then((value) {
      emit(ShopSuccessCategoryProductsState());
      preventCorona = CategoryProductsModel.fromJson(value.data);

    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoryProductsState());
    });
  }

  CategoryProductsModel? sports;
  void getSports() {
    emit(ShopLoadingCategoryProductsState());
    DioHelper.getData(
      url: sportsURL,
      token: token,
    ).then((value) {
      emit(ShopSuccessCategoryProductsState());
      sports = CategoryProductsModel.fromJson(value.data);

    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoryProductsState());
    });
  }

  CategoryProductsModel? lighting;
  void getLighting() {
    emit(ShopLoadingCategoryProductsState());
    DioHelper.getData(
      url: lightingURL,
      token: token,
    ).then((value) {
      emit(ShopSuccessCategoryProductsState());
      lighting = CategoryProductsModel.fromJson(value.data);

    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoryProductsState());
    });
  }

  CategoryProductsModel? clothes;
  void getClothes() {
    emit(ShopLoadingCategoryProductsState());
    DioHelper.getData(
      url: clothesURL,
      token: token,
    ).then((value) {
      emit(ShopSuccessCategoryProductsState());
      clothes = CategoryProductsModel.fromJson(value.data);

    }).catchError((error) {
      print(error);
      emit(ShopErrorCategoryProductsState());
    });
  }

}
