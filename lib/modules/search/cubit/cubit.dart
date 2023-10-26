import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/modules/search/cubit/states.dart';

class SearchCubit extends Cubit<SearchStates> {
  SearchCubit() : super(SearchInitialStates());

  static SearchCubit get(context) => BlocProvider.of(context);
}
