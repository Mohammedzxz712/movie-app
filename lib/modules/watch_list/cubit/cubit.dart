import 'package:bloc/bloc.dart';

import '../../../models/watch_list_model.dart';

class WatchlistCubit extends Cubit<List<WatchlistItem>> {
  WatchlistCubit() : super([]);

  void addToWatchlist(WatchlistItem item) {
    final currentWatchlist = state;
    currentWatchlist.add(item);
    emit(List<WatchlistItem>.from(currentWatchlist));
  }

}
