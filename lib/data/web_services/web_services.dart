import 'dart:html';

import 'package:breaking_bad_clone/core/constants/strings.dart';
import 'package:breaking_bad_clone/domain/models/location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class WebServices {
  late Dio dio;
  //final firestore = FirebaseFirestore.instance;

  WebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 1000,
      receiveTimeout: 60 * 1000,
    );
    dio = Dio(options);
  }

  Future<void> addLocation(
      double lat, double long, String name, String des, double rate) async {
    try{
      await FirebaseFirestore.instance.collection('Locations').doc(name).set({
        'latitude': lat,
        'longitude': long,
        'Name': name,
        'Description': des,
        'rate': rate,
      });
    }catch(e){
      print(e);
    }
  }

  Future<QuerySnapshot?> getLocationsData() async{
    try{
      final locationsResponse = await FirebaseFirestore.instance.collection('Locations').get();
      return locationsResponse;
    }catch(e){
      print(e);
    }
    return null;
  }
}
