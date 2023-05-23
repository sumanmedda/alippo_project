import 'package:alippo_project/controller/logic/homepage_cubits/homepageapi_cubit.dart';
import 'package:alippo_project/controller/repositories/homepageapis_repository.dart';
import 'package:alippo_project/model/banner/banners_model.dart';
import 'package:alippo_project/model/homepage_model.dart';
import 'package:alippo_project/model/mostpopular_model.dart';
import 'package:alippo_project/model/mostvisited_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomepageAPisCubit extends Cubit<HomepageAPIsState> {
  HomepageAPisCubit() : super(HomepageAPIsLoadingState()) {
    fetchHomepageAPis();
  }

  HomepageAPIsRepository homepageAPIsRepository = HomepageAPIsRepository();

  fetchHomepageAPis() async {
    try {
      List<HomepageAPIsModel> homepageAPis =
          await homepageAPIsRepository.fetchAPIsPath();

      // ignore: prefer_typing_uninitialized_variables
      var bannersPath, mostVisitedPath, mostPopularPath;

      // code to get values from homepageAPis
      // ignore: unused_local_variable
      bannersPath = homepageAPis.where((e) => e.apiPath == 'banners');
      mostVisitedPath = homepageAPis.where((e) => e.apiPath == 'mostvisited');
      mostPopularPath = homepageAPis.where((e) => e.apiPath == 'mostpopular');
      // END

      List<BannersModel> banners =
          await homepageAPIsRepository.fetchbanners(bannersPath);
      List<MostVisitedModel> mostVisited =
          await homepageAPIsRepository.fetchmostVisited(mostVisitedPath);
      List<MostPopularModel> mostPopular =
          await homepageAPIsRepository.fetchmostPopular(mostPopularPath);
      emit(HomepageAPIsLoadedState(homepageAPis, banners, mostVisited,
          mostPopular)); // when app is loaded HomepageAPis data is sent to HomepageAPisLoadedState
    } catch (e) {
      emit(HomepageAPIsErrorState(e
          .toString())); // if something wrong happens this will print out the issue
    }
  }
}
