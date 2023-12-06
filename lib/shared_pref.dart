import 'package:shared_preferences/shared_preferences.dart';

Future<Set<int>> getWatchlistFromPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return Set<int>.from(prefs.getStringList('watchlist')?.map((id) => int.parse(id)) ?? []);
}

// Define a method to save the watchlist state to shared preferences
Future<void> saveWatchlistToPrefs(Set<int> watchlist) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('watchlist', watchlist.map((id) => id.toString()).toList());
}



