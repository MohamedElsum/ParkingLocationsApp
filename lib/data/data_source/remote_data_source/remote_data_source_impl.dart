import 'package:breaking_bad_clone/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:breaking_bad_clone/data/web_services/web_services.dart';
import 'package:breaking_bad_clone/domain/models/location.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final WebServices webServices;

  RemoteDataSourceImpl(this.webServices);

  @override
  Future<void> addLocation(
      String lat, String long, String name, String des, String rate) async {
    await webServices.addLocation(lat, long, name, des, rate);
  }

  @override
  Future<List<Locations>> getLocationsData() async {
    final locationsResponse = await webServices.getLocationsData();
    final List<Locations> locationsResponseData = [];
    for (int i = 0; i < locationsResponse!.docs.length; i++) {
      locationsResponseData.add(Locations(
        longitude: locationsResponse.docs[i].get('longitude'),
        latitude: locationsResponse.docs[i].get('latitude'),
        rate: locationsResponse.docs[i].get('rate'),
        desc: locationsResponse.docs[i].get('Description'),
        name: locationsResponse.docs[i].get('Name'),
      ));
    }
    return locationsResponseData;
  }
}
