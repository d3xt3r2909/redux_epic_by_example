import 'package:meta/meta.dart';

@immutable
class Movie {
  const Movie({this.title, this.description, this.fetchTime});

  final String title;
  final String description;
  final String fetchTime;
}
