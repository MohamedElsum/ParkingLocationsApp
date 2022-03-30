import 'package:breaking_bad_clone/data/web_services/web_services.dart';
import 'local_data_source.dart';

class LocalDataSourceImpl implements LocalDataSource {
  final WebServices webServices;

  LocalDataSourceImpl(this.webServices);
}
