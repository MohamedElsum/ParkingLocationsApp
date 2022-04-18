import 'package:breaking_bad_clone/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:breaking_bad_clone/domain/models/location.dart';
import 'package:breaking_bad_clone/domain/repository/main_repo.dart';

class RepoImpl implements Repository {
  final RemoteDataSourceImpl remoteDataSourceImpl;

  RepoImpl(this.remoteDataSourceImpl);

  @override
  Future<void> addLocation(
      double lat, double long, String name, String des, double rate) async {
    await remoteDataSourceImpl.addLocation(lat, long, name, des, rate);
  }

  @override
  Future<List<Locations>> getLocationsData() async{
    final locationsResponse = await remoteDataSourceImpl.getLocationsData();
    return locationsResponse;
  }


}
