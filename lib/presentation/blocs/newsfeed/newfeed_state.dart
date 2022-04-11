import 'package:cncm_flutter_new/data/models/news_feed.dart';
import 'package:equatable/equatable.dart';

abstract class NewsFeedState extends Equatable {}

class InitialState extends NewsFeedState {
  @override
  List<Object?> get props => [];
}

class LoadingNewFeed extends NewsFeedState {
  @override
  List<Object?> get props => [];
}

class ErrorGettingFeeds extends NewsFeedState {
  final String message;

  ErrorGettingFeeds(this.message);
  @override
  List<Object?> get props => [message];
}

class LoadedNewsFeed extends NewsFeedState {
  final List<NewsFeed> newsFeed;

  LoadedNewsFeed(this.newsFeed);
  @override
  List<Object?> get props => [newsFeed];
}
