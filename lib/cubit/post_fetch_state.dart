part of 'post_fetch_cubit.dart';

abstract class PostFetchState extends Equatable {
  const PostFetchState();
  @override
  List<Object> get props => [];
}

class PostFetchInitial extends PostFetchState {}

class PostFetchLoading extends PostFetchState {}

class PostFetchLoaded extends PostFetchState {
  final List<Post> postList;

  const PostFetchLoaded({
    required this.postList,
  });

  @override
  List<Object> get props => [postList];
}

class PostFetchError extends PostFetchState {
  final Failure failure;

  const PostFetchError({
    required this.failure,
  });
  @override
  List<Object> get props => [failure];
}
