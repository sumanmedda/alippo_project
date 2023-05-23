import 'dart:developer';

import 'package:alippo_project/model/banner/banners_model.dart';
import 'package:alippo_project/model/homepage_model.dart';
import 'package:alippo_project/model/mostpopular_model.dart';
import 'package:alippo_project/model/mostvisited_model.dart';

import '../../model/banner/banner_priority_model.dart';
import '../api/homepage_apis.dart';

class HomepageAPIsRepository {
  // to fetch apis path
  Future<List<HomepageAPIsModel>> fetchAPIsPath() async {
    try {
      var path = HomapageAPIsPath.homepageAPIs;
      dynamic response =
          (path); // response will store the data fetched from api

      List<dynamic> homepageapisMaps = response;

      return homepageapisMaps
          .map((homepageapisMap) => HomepageAPIsModel.fromJson(homepageapisMap))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<BannersModel>> fetchbanners(bannerApipath) async {
    try {
      var path = HomapageAPIsPath.banners;
      dynamic response =
          (path); // response will store the data fetched from api

      List<dynamic> bannersMaps = response;

      return bannersMaps
          .map((bannersMap) => BannersModel.fromJson(bannersMap))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MostVisitedModel>> fetchmostVisited(mostVisitedApipath) async {
    try {
      var path = HomapageAPIsPath.mostvisited;
      dynamic response =
          (path); // response will store the data fetched from api
      List<dynamic> mostVisitedMaps = response;

      return mostVisitedMaps
          .map((mostVisitedMap) => MostVisitedModel.fromJson(mostVisitedMap))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<List<MostPopularModel>> fetchmostPopular(mostPopularApipath) async {
    try {
      var path = HomapageAPIsPath.mostpopular;
      dynamic response =
          (path); // response will store the data fetched from api
      List<dynamic> mostPopularMaps = response;

      return mostPopularMaps
          .map((mostPopularMap) => MostPopularModel.fromJson(mostPopularMap))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
