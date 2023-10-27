import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/BrowseModelName.dart';
import 'package:movie_app/modules/browse/cubit/states.dart';
import '../../../shared/network/remote/dio_helper.dart';

class BrowseNamCubit extends Cubit<BrowseNamStates> {
  BrowseNamCubit() : super(BrowseInitial());
  static BrowseNamCubit get(context) => BlocProvider.of(context);

  BrowseModelName? browseModelName;
  void getBrowseNamData() {
    emit(GetLoadBrowseNamData());
    DioHelper.getData(
            url: "genre/movie/list",
            query: {'page': 1, 'api_key': '261a2d97cdf43345c8e7e990bceda0eb'})
        .then((value) {
      print(value.toString());
      browseModelName = BrowseModelName.fromJson(value!.data);
      print(browseModelName?.genres?[0].name);
      emit(GetBrowseNamSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBrowseNamError());
    });
  }
}
