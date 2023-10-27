import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/search/cubit/states.dart';

import '../../../models/SearchModel.dart';
import '../../../shared/network/remote/dio_helper.dart';
import '../../../shared/network/remote/end_points.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);

  SearchModel? searchModel;

  void searchData(String text) {
    emit(SearchLoadingStates());
    DioHelper.getData(url: SEARCH, query: {
      'page': 1,
      'api_key': '261a2d97cdf43345c8e7e990bceda0eb',
      'query': text,
    }).then((value) {
      print(value.toString());
      searchModel = SearchModel.fromJson(value!.data);
      emit(SearchSuccessStates());
    }).catchError((error) {
      print(error.toString());
      emit(SearchErrorStates());
    });
  }
}
