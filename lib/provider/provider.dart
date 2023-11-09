import 'package:flutter/foundation.dart';

class WatchlistProvider extends ChangeNotifier {
  Set<int> _watchlistItems = Set<int>();

  Set<int> get watchlistItems => _watchlistItems;

  void addToWatchlist(int itemId) {
    _watchlistItems.add(itemId);
    notifyListeners();
  }

  void removeFromWatchlist(int itemId) {
    _watchlistItems.remove(itemId);
    notifyListeners();
  }
}
