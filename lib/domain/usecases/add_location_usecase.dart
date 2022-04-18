import 'package:breaking_bad_clone/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:breaking_bad_clone/data/web_services/web_services.dart';
import 'package:breaking_bad_clone/domain/respository_impl/repo_impl.dart';

class AddLocationUsecase {
  late final RepoImpl repoImpl;

  AddLocationUsecase() {
    repoImpl = RepoImpl(RemoteDataSourceImpl(WebServices()));
  }

  Future<void> addLocation(
      String lat, String long, String name, String des, String rate) async {
    await repoImpl.addLocation(lat, long, name, des, rate);
  }
}
