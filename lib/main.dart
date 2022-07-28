import 'package:api_with_cubit/repository/api_reposiitory.dart';
import 'package:api_with_cubit/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/post_fetch_cubit.dart';
import 'screens/home_page.dart';

void main() {
  runApp(MyApp(
    apiService: ApiService(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.apiService}) : super(key: key);

  final ApiService apiService;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostFetchCubit>(
          create: (context) => PostFetchCubit(
            apiRepository: ApiRepository(
              apiService: apiService,
            ),
          )..fetchPostApi(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
