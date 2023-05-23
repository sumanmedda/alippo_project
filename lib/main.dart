import 'package:alippo_project/controller/logic/homepage_cubits/homepageapis_cubit.dart';
import 'package:alippo_project/view/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controller/logic/internet_cubits/internet_cubit.dart';

// fitst time app launches
void main() {
  // first materialapp page which renders
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(),
        ),
        BlocProvider<HomepageAPisCubit>(
          create: (context) => HomepageAPisCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Data App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // first page which renders
        home: const Homepage(),
      ),
    );
  }
}
