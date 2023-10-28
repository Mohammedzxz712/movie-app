import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/SimilarModel.dart';
import 'package:movie_app/modules/details/cubit/states.dart';

import '../../../models/DetailsModel.dart';
import '../../../shared/network/remote/dio_helper.dart';

class DetailsCubit extends Cubit<DetailsStates> {
  DetailsCubit() : super(Initial());
  static DetailsCubit get(context) => BlocProvider.of(context);

  DetailsModel? detailsModel;
  void getDetailsData(num? id) {
    emit(GetLoadDetailsData());
    DioHelper.getData(
            url: "movie/$id",
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      detailsModel = DetailsModel.fromJson(value!.data);
      emit(GetDetailsDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetDetailsDataError());
    });
  }

  SimilarModel? similarModel;
  void getSimilarData(num? id) {
    emit(GetLoadSimilarData());
    DioHelper.getData(
            url: "movie/$id/similar",
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      similarModel = SimilarModel.fromJson(value!.data);
      emit(GetSimilarDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetSimilarDataError());
    });
  }
}
