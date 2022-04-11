import 'package:cncm_flutter_new/data/data_providers/auth_dataprovider.dart';
import 'package:cncm_flutter_new/data/data_providers/newsfeed_dataprovider.dart';
import 'package:cncm_flutter_new/data/repositories/auth_repository.dart';
import 'package:cncm_flutter_new/data/repositories/newsfeed_repository.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_bloc.dart';
import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newsfeed_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';

var sl = GetIt.instance;

Future initServiceLocator() async {
  //Data providers
  sl.registerSingleton<Dio>(Dio());

  //data providers
  sl.registerFactory<AuthDataProvider>(() => AuthDataProvider());
  sl.registerFactory<NewsFeedDataProvider>(() => NewsFeedDataProvider());

  //repo
  sl.registerFactory<AuthRepository>(() => AuthRepository(sl()));
  sl.registerFactory<NewsFeedRepository>(() => NewsFeedRepository(sl()));

  //blocs
  sl.registerFactory<AuthBloc>(() => AuthBloc(sl()));
  sl.registerFactory<NewsFeedBloc>(() => NewsFeedBloc(sl()));

  //Hive boxes
  await Hive.openBox('authData');

  debugPrint('Initialized all elements');
}
