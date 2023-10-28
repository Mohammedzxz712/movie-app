class HomeModel {
  HomeModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    if (json['results'] != null) {
      json['results'].forEach((v) {
        results.add(Results.fromJson(v));
      });
    }
  }
  num? page; // Changed from double? to num?
  List<Results> results = [];
  num? totalPages; // Changed from double? to num?
  num? totalResults; // Changed from double? to num?
}

class Results {
  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<int>() : [];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }
  bool? adult;
  String? backdropPath;
  List<int>?
      genreIds; // Changed from List<double?> to List<int> to match the JSON data
  num? id; // Changed from double? to num?
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  num? popularity; // Changed from double? to num?
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  num? voteAverage; // Changed from double? to num?
  num? voteCount; // Changed from double? to num?
}
