import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/browse_details/cubit/states.dart';

import '../../../models/BrowseDetailsModel.dart';

import '../../../shared/components/constant.dart';
import '../../../shared/network/remote/dio_helper.dart';

class BrowseDetailsCubit extends Cubit<BrowseDetailsStates> {
  BrowseDetailsCubit() : super(BrowseDetailsInitial());
  static BrowseDetailsCubit get(context) => BlocProvider.of(context);

  BrowseDetailsModel? browseDetailsModel;
  void getDetailsData(num? id) {
    emit(GetLoadBrowseDetailsData());
    DioHelper.getData(url: "discover/movie", query: {
      'page': 1,
      'with_genres': id,
      'api_key': APIKEY,
    }).then((value) {
      print(value.toString());
      browseDetailsModel = BrowseDetailsModel.fromJson(value!.data);
      print(browseDetailsModel?.results?[0].overview);
      emit(GetBrowseDetailsDataSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBrowseDetailsDataError());
    });
  }
}
