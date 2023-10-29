import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/search/cubit/states.dart';

import '../../../models/SearchModel.dart';
import '../../../shared/components/constant.dart';
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
      'adults': false,
      'api_key': APIKEY,
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
