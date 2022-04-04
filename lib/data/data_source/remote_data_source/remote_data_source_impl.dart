import 'dart:html';

import 'package:breaking_bad_clone/data/data_source/remote_data_source/remote_data_source.dart';
import 'package:breaking_bad_clone/data/web_services/web_services.dart';
import 'package:breaking_bad_clone/domain/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final WebServices webServices;

  RemoteDataSourceImpl(this.webServices);

  @override
  Future<void> addLocation(
      double lat, double long, String name, String des, double rate) async {
    await webServices.addLocation(lat, long, name, des, rate);
  }

  @override
  Future<List<Locations>> getLocationsData() async {
    final locationsResponse = await webServices.getLocationsData();
    final List<Locations> locationsResponseData = [];
    locationsResponse?.docs.map((parkingItem) {
      locationsResponseData.add(Locations(
        longitude: parkingItem['longitude'],
        latitude: parkingItem['latitude'],
        rate: parkingItem['rate'],
        desc: parkingItem['Description'],
        name: parkingItem['Name'],
      ));
    });
    return locationsResponseData;
  }
}
