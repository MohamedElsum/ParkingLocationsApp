import 'package:breaking_bad_clone/data/data_source/remote_data_source/remote_data_source_impl.dart';
import 'package:breaking_bad_clone/domain/repository/main_repo.dart';

class RepoImpl implements Repository {
  final RemoteDataSourceImpl remoteDataSourceImpl;

  RepoImpl(this.remoteDataSourceImpl);
}
