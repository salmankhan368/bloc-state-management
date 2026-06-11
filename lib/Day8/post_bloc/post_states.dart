import 'package:equatable/equatable.dart';
import 'package:my_bloc/Day8/model/post_model.dart';
import 'package:my_bloc/utils/enum.dart';

class PostStates extends Equatable {
  final PostStatus postStatus;
  final String message;
  final List<PostModel> postList;
  final List<PostModel> tempPostList;
  const PostStates({
    this.postStatus = PostStatus.loading,
    this.postList = const <PostModel>[],
    this.tempPostList = const <PostModel>[],
    this.message = '',
  });
  PostStates copyWith({
    PostStatus? postStatus,
    List<PostModel>? postList,
    String? message,
    List<PostModel>? tempPostList,
  }) {
    return PostStates(
      postStatus: postStatus ?? this.postStatus,
      postList: postList ?? this.postList,
      tempPostList: tempPostList ?? this.tempPostList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [postStatus, postList, message, tempPostList];
}
