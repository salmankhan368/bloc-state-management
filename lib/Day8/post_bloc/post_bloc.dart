import 'package:bloc/bloc.dart';
import 'package:my_bloc/Day8/model/post_model.dart';

import 'package:my_bloc/Day8/post_bloc/post_event.dart';
import 'package:my_bloc/Day8/post_bloc/post_states.dart';
import 'package:my_bloc/repository/post_repository.dart';
import 'package:my_bloc/utils/enum.dart';

class PostBloc extends Bloc<PostEvent, PostStates> {
  PostRepository postRepository = PostRepository();
  List<PostModel> tempPostList = [];
  PostBloc() : super(PostStates()) {
    on<PostFetched>(fetchPostApi);
    on<SearchItem>(_filterList);
  }
  void fetchPostApi(PostFetched event, Emitter<PostStates> emit) async {
    await postRepository
        .fetchPostApi()
        .then((value) {
          emit(
            state.copyWith(
              postStatus: PostStatus.success,
              postList: value,
              message: 'success',
            ),
          );
        })
        .onError((error, stackTrace) {
          print(error.toString());
          emit(
            state.copyWith(
              postStatus: PostStatus.failure,
              message: error.toString(),
            ),
          );
        });
  }

  void _filterList(SearchItem event, Emitter<PostStates> emit) {
    // 1. Agar search bar khali hai, toh temp list ko khali karo
    if (event.stSearch.isEmpty) {
      emit(state.copyWith(tempPostList: const []));
      return;
    }

    // Search text ko lowercase me convert karein taaki case-sensitive ka masala na ho
    final query = event.stSearch.toLowerCase();

    // 2. ID OR Email dono pe filter lagayein
    final filtered = state.postList.where((element) {
      final matchesId = element.id.toString() == query;
      final matchesEmail = element.email.toString().toLowerCase().contains(
        query,
      );

      return matchesId || matchesEmail; // Agar dono me se ek bhi true ho
    }).toList();

    // 3. AGAR DATA NAHI MILA: Toh dummy item emit karo
    if (filtered.isEmpty) {
      emit(
        state.copyWith(
          tempPostList: [
            PostModel(id: -1, postId: -1, email: 'No data found', body: ''),
          ],
        ),
      );
    } else {
      // 4. Agar data mil gaya, toh filtered list emit karo
      emit(state.copyWith(tempPostList: filtered));
    }
  }
}
