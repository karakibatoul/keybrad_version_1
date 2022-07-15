import '../models/cities.dart';

class Utils {
  static int ascendingSort(City c1, City c2) =>
      c1.Name.compareTo(c2.Name);
}