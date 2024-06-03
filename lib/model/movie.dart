class Movie {
  final String name;
  final int year;
  final String imdbId;
  final String type;
  final String poster;

  Movie({required this.name, required this.year, required this.imdbId, required this.type, required this.poster});

  @override
  String toString() {
    return "Movie [\n"
        "name=$name, \n"
        "year=$year, \n"
        "imdbID=$imdbId, \n"
        "type=$type\n"
        "]";
  }
}