import 'package:equatable/equatable.dart';

abstract class NewFeedEvent extends Equatable {}

class LoadNewsFeed extends NewFeedEvent {
  @override
  List<Object?> get props => [];
}
