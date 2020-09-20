import 'package:intl/intl.dart';
import 'package:redux_epic_by_example/model/movie.dart';

List<Movie> fetchMockDataArray() {
  String time = DateFormat.jms().format(DateTime.now());
  final movieQueue = <Movie>[];

  for (int i = 1; i < 101; i++) {
    movieQueue.add(Movie(
      title: 'MovieTitle$i',
      description: 'MovieDescription$i',
      fetchTime: time,
    ));
  }

  return movieQueue;
}
