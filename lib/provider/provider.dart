import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../shared_pref.dart';

class WatchlistProvider extends ChangeNotifier {
  late Set<int> _watchlistItems;
  late SharedPreferences _prefs;
  // Constructor
  WatchlistProvider(this._prefs) {
    // Initialize watchlist from shared preferences during initialization
    _initializeWatchlist();
  }

  // Getter for watchlist
  Set<int> get watchlistItems => _watchlistItems;

  // Method to initialize the watchlist from shared preferences
  Future<void> _initializeWatchlist() async {
    _watchlistItems = await getWatchlistFromPrefs();
    notifyListeners();
  }

  // Method to add an item to the watchlist
  void addToWatchlist(int itemId) {
    _watchlistItems.add(itemId);
    // Save the updated watchlist to shared preferences
    saveWatchlistToPrefs(_watchlistItems);
    notifyListeners();
  }

  // Method to remove an item from the watchlist
  void removeFromWatchlist(int itemId) {
    _watchlistItems.remove(itemId);
    // Save the updated watchlist to shared preferences
    saveWatchlistToPrefs(_watchlistItems);
    notifyListeners();
  }
}
