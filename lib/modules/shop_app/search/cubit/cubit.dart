import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_am_rich/models/shop_model/search_model.dart';
import 'package:i_am_rich/modules/shop_app/search/cubit/states.dart';
import 'package:i_am_rich/shared/network/end_points.dart';
import 'package:i_am_rich/shared/network/remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void search(String text) {
    emit(SearchLoadingState());
    DioHelper.postData(
      url: SEARCH,
      data: {
        'text' :text
      },
    ).then((value){
      searchModel =SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((error){
      print(error.toString());
      emit(SearchErrorState());
    });
  }
}
