// bloc cubits performs when events are occured
import 'package:alippo_project/model/banner/banners_model.dart';
import 'package:alippo_project/model/homepage_model.dart';
import 'package:alippo_project/model/mostpopular_model.dart';
import 'package:alippo_project/model/mostvisited_model.dart';

abstract class HomepageAPIsState {}

class HomepageAPIsLoadingState extends HomepageAPIsState {}

class HomepageAPIsLoadedState extends HomepageAPIsState {
  final List<HomepageAPIsModel> homapageApisPath;
  final List<BannersModel> banners;
  final List<MostVisitedModel> mostVisited;
  final List<MostPopularModel> mostPopular;
  HomepageAPIsLoadedState(
    this.homapageApisPath,
    this.banners,
    this.mostVisited,
    this.mostPopular,
  );
}

class HomepageAPIsErrorState extends HomepageAPIsState {
  final String error;
  HomepageAPIsErrorState(this.error);
}
