import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bloc/Day8/post_bloc/post_bloc.dart';
import 'package:my_bloc/Day8/post_bloc/post_event.dart';
import 'package:my_bloc/Day8/post_bloc/post_states.dart';
import 'package:my_bloc/utils/enum.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        title: const Text(
          'API Integration with BLoC',
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white, // Standard white color for visibility
            fontSize: 20,
          ),
        ),
      ),
      body: BlocBuilder<PostBloc, PostStates>(
        builder: (context, state) {
          switch (state.postStatus) {
            case PostStatus.loading:
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.deepPurple),
                ),
              );

            case PostStatus.failure:
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 60,
                        color: Colors.red[400],
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'Oops! Something went wrong',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        state.message.toString(),
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),
              );

            case PostStatus.success:
              // 1. Check karein ki kya user search kar raha hai
              final isSearching = state.tempPostList.isNotEmpty;

              // 2. Check karein ki kya dummy "No Data" item mila hai BLoC se
              final hasNoData =
                  state.tempPostList.isNotEmpty &&
                  state.tempPostList.first.id == -1;

              // 3. Agar dummy item mila hai toh list ko khali dikhao, warna filter list ya original list lo
              final currentList = hasNoData
                  ? const []
                  : (isSearching ? state.tempPostList : state.postList);

              return Column(
                children: [
                  // Modern Clean Search Bar Container
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 8,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Search posts by ID...',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Colors.deepPurple,
                        ),
                        filled: true,
                        fillColor: Colors.grey[100],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.grey[200]!),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(
                            color: Colors.deepPurple,
                            width: 1.5,
                          ),
                        ),
                      ),
                      onChanged: (filterKey) {
                        context.read<PostBloc>().add(SearchItem(filterKey));
                      },
                    ),
                  ),

                  // Elegant Dynamic Post List
                  // 4. Agar hasNoData true hai, toh direct "No matching items found." screen show ho jayegi
                  Expanded(
                    child: hasNoData || (currentList.isEmpty && isSearching)
                        ? Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.search_off,
                                  size: 48,
                                  color: Colors.grey[400],
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'No matching items found.',
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(12),
                            itemCount: currentList.length,
                            itemBuilder: (context, index) {
                              final item = currentList[index];
                              return Card(
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                  side: BorderSide(color: Colors.grey[200]!),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: ListTile(
                                    leading: CircleAvatar(
                                      backgroundColor: Colors.deepPurple
                                          .withOpacity(0.1),
                                      child: Text(
                                        item.id.toString(),
                                        style: const TextStyle(
                                          color: Colors.deepPurple,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      item.email.toString(),
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                      ),
                                    ),
                                    subtitle: Padding(
                                      padding: const EdgeInsets.only(top: 6.0),
                                      child: Text(
                                        item.body.toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontSize: 13,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
          }
        },
      ),
    );
  }
}
