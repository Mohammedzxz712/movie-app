class WatchlistItem {
  final String title;
  final String releaseYear;
  final String description;
  final String imageUrl;
  final bool isAddedToWatchlist;
  final num id;

  WatchlistItem({
    required this.title,
    required this.releaseYear,
    required this.description,
    required this.imageUrl,
    this.isAddedToWatchlist = false,
    required this.id
  });
}
