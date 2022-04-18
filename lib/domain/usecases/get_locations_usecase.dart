import 'package:breaking_bad_clone/domain/models/location.dart';
import '../../data/data_source/remote_data_source/remote_data_source_impl.dart';
import '../../data/web_services/web_services.dart';
import '../respository_impl/repo_impl.dart';

class GetLocationUsecase {
  late final RepoImpl repoImpl;

  GetLocationUsecase() {
    repoImpl = RepoImpl(RemoteDataSourceImpl(WebServices()));
  }

  Future<List<Locations>> getLocationsData() async{
    final locationsResponse = await repoImpl.getLocationsData();
    return locationsResponse;
  }
}
