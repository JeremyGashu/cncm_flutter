import 'package:cncm_flutter_new/data/models/news_feed.dart';
import 'package:cncm_flutter_new/data/repositories/newsfeed_repository.dart';
import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newfeed_state.dart';
import 'package:cncm_flutter_new/presentation/blocs/newsfeed/newsfeed_events.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsFeedBloc extends Bloc<NewFeedEvent, NewsFeedState> {
  final NewsFeedRepository newsFeedRepository;
  NewsFeedBloc(this.newsFeedRepository) : super(InitialState());

  @override
  Stream<NewsFeedState> mapEventToState(NewFeedEvent event) async* {
    if (event is LoadNewsFeed) {
      yield LoadingNewFeed();
      try {
        List<NewsFeed> newsFeeds = await newsFeedRepository.loadNewsFeed();
        yield LoadedNewsFeed(newsFeeds);
      } catch (e) {
        debugPrint('$e');
        yield ErrorGettingFeeds('Error getting feeds');
      }
    }
  }
}
