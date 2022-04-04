import 'package:breaking_bad_clone/domain/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract class Repository {
  Future<void> addLocation(
      double lat, double long, String name, String des, double rate);

  Future<List<Locations>> getLocationsData();
}
