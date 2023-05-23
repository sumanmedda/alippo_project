import 'package:alippo_project/controller/logic/homepage_cubits/homepageapi_cubit.dart';
import 'package:alippo_project/controller/logic/homepage_cubits/homepageapis_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/const.dart';
import '../controller/logic/internet_cubits/internet_cubit.dart';
import '../controller/logic/internet_cubits/internet_state.dart';
import '../controller/widgets/custom_appbar.dart';

enum PriorityType { banners, mostvisited, mostpopular }

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  return ListView.builder(
                      itemCount: homepageApiState.homapageApisPath.length,
                      itemBuilder: (context, index) {
                        var path = homepageApiState.homapageApisPath[index];
                        return path.apiPath == PriorityType.banners
                            ? Center(
                                child: Text(
                                path.apiPath!,
                              ))
                            : Center(
                                child: Text(
                                path.id!,
                              ));
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
