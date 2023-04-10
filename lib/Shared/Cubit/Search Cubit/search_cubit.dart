

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingproject/Shared/Cubit/Search%20Cubit/search_states.dart';

import '../../../Models/Search Model/search_model.dart';
import '../../../Network/End Point/end_point.dart';
import '../../../Network/Remote/dio_helper.dart';

class SearchCubit extends Cubit<SearchStates>
{

  SearchCubit() : super(SearchInitialState());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;
  void Search(String text)
  {
    emit(SearchLoadingState());

    DioHelper.postData(
        url: SEARCH,
        token: Token,
        data:
        {
          'text': text,
        },
    ).then((value)
    {
      searchModel = SearchModel.fromJson(value.data);
      emit(SearchSuccessState());
    }).catchError((onError)
    {
      print(onError.toString());
      emit(SearchErrorState(onError.toString()));
    });
  }

}