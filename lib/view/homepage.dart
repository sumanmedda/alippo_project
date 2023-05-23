import 'package:alippo_project/controller/logic/homepage_cubits/homepageapi_cubit.dart';
import 'package:alippo_project/controller/logic/homepage_cubits/homepageapis_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/const.dart';
import '../controller/logic/internet_cubits/internet_cubit.dart';
import '../controller/logic/internet_cubits/internet_state.dart';
import '../controller/widgets/banners_block.dart';
import '../controller/widgets/custom_appbar.dart';
import '../controller/widgets/homepage_component.dart';
import '../controller/widgets/mostpopular_block.dart';
import '../controller/widgets/mostvisited_block.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> priorityOrder = [];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(appBarHeight),
        child: const CustomAppBar(
          title: 'Homepage',
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, internetState) =>
              BlocBuilder<HomepageAPisCubit, HomepageAPIsState>(
            builder: (context, homepageApiState) {
              // When internet is connected
              if (internetState is InternetGainedState) {
                // data is loading from api
                if (homepageApiState is HomepageAPIsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }

                // data is loaded
                if (homepageApiState is HomepageAPIsLoadedState) {
                  var path = homepageApiState.homapageApisPath;
                  for (int i = 0; i < path.length; i++) {
                    priorityOrder.add(path[i].priority);
                  }

                  return ListView.builder(
                      itemCount: priorityOrder.length,
                      itemBuilder: (context, index) {
                        var path = priorityOrder[index];
                        switch (path) {
                          case 'banners':
                            return HomepageComponent(
                              itemName: priorityOrder[index],
                              widget: BannersWidget(
                                  state: homepageApiState.banners),
                            );

                          case 'mostvisited':
                            return HomepageComponent(
                              itemName: priorityOrder[index],
                              widget: MostVisitedWidget(
                                  state: homepageApiState.mostVisited),
                            );
                          case 'mostpopular':
                            return HomepageComponent(
                              itemName: priorityOrder[index],
                              widget: MostPopularWidget(
                                  state: homepageApiState.mostPopular),
                            );
                          default:
                            return const Center(child: Text('No Item Found'));
                        }
                      });
                }

                if (homepageApiState is HomepageAPIsErrorState) {
                  return Center(
                    child: Text(
                      homepageApiState.error,
                      textAlign: TextAlign.center,
                    ),
                  );
                }
              }
              // When internet is not connected
              if (internetState is InternetLostState) {
                return const Center(
                  child: Text('Internet Not Connected'),
                );
              }

              // If Something went Wrong / No Data
              return const Center(
                child: Text(
                  'No Data Found',
                  textAlign: TextAlign.center,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
