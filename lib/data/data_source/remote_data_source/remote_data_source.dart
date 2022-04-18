import 'package:breaking_bad_clone/domain/models/location.dart';

abstract class RemoteDataSource {
  Future<void> addLocation(
      String lat, String long, String name, String des, String rate);

  Future<List<Locations>> getLocationsData();
}
