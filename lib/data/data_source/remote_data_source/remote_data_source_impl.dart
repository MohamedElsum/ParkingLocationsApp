import 'package:breaking_bad_clone/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:breaking_bad_clone/data/web_services/web_services.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final WebServices webServices;

  RemoteDataSourceImpl(this.webServices);
}
