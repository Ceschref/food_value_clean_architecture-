import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:web_provise/core/helper/local_storage_helper.dart';
import 'package:web_provise/data/data_source_impl/food_value_local_data_source_impl.dart';
import 'package:web_provise/data/data_source_impl/food_value_remote_data_source_impl.dart';
import 'package:web_provise/data/repositories_impl/food_value_repository_impl.dart';
import 'package:web_provise/domain/repositories/food_value_repository.dart';
import 'package:web_provise/representation/cubit/food_value_cubit/food_value_cubit.dart';
import 'package:web_provise/representation/screen/food_value/food_value_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/http_client/api_provider.dart';
import 'core/logging/bloc_observer.dart';

void main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initStorage();
  Bloc.observer = AppBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<ApiProviderRepository>(
          create: (context) => ApiProviderRepositoryImpl(),
        ),
        RepositoryProvider<FoodValueRepository>(
          create: (context) => FoodValueRepositoryImpl(
            foodValueLocalDataSource: FoodValueLocalDataSourceImpl(),
            foodValueRemoteDataSource: FoodValueRemoteDataSourceImpl(
              apiProvider: context.read<ApiProviderRepository>(),
            ),
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FoodValueCubit>(
            create: (context) => FoodValueCubit(
              foodValueRepository: context.read<FoodValueRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const FoodValueScreen(),
        ),
      ),
    );
  }
}
