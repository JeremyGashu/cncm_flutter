import 'package:cncm_flutter_new/bloc_observer.dart';
import 'package:cncm_flutter_new/core/route.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_bloc.dart';
import 'package:cncm_flutter_new/presentation/blocs/auth/auth_events.dart';
import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newsfeed_bloc.dart';
import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newsfeed_events.dart';
import 'package:cncm_flutter_new/presentation/pages/splach_screen.dart';
import 'package:cncm_flutter_new/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  await initServiceLocator();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
            create: (_) => sl<AuthBloc>()..add(CheckAuthOnStartUp())),
        BlocProvider<NewsFeedBloc>(
            create: (_) => sl<NewsFeedBloc>()..add(LoadNewsFeed())),
      ],
      child: const MaterialApp(
        onGenerateRoute: AppRoute.onGenerateRoute,
        initialRoute: SplashScreenPage.splachScreenRouteName,
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}
