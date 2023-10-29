import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/models/BrowseModelName.dart';
import 'package:movie_app/modules/browse/cubit/states.dart';
import '../../../shared/components/constant.dart';
import '../../../shared/network/remote/dio_helper.dart';

class BrowseNamCubit extends Cubit<BrowseNamStates> {
  BrowseNamCubit() : super(BrowseInitial());

  static BrowseNamCubit get(context) => BlocProvider.of(context);

  BrowseModelName? browseModelName;

  void getBrowseNamData() {
    emit(GetLoadBrowseNamData());
    DioHelper.getData(url: "genre/movie/list", query: {
      'page': 1,
      'api_key': APIKEY,
    }).then((value) {
      browseModelName = BrowseModelName.fromJson(value!.data);

      emit(GetBrowseNamSuccess());
    }).catchError((error) {
      print(error.toString());
      emit(GetBrowseNamError());
    });
  }
}
