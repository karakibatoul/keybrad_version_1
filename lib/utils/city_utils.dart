import '../models/cities.dart';

class Utils {
  static int ascendingSort(City c1, City c2) =>
      c1.name.compareTo(c2.name);
}