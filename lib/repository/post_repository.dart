import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:my_bloc/Day8/model/post_model.dart';

class PostRepository {
  Future<List<PostModel>> fetchPostApi() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/comments'),
      );
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return PostModel(
            id: e['id'] as int,
            postId: e['postId'] as int,
            email: e['email'] as String,
            body: e['body'] as String,
          );
        }).toList();
      } else {
        throw Exception('Failed to fetch posts: ${response.statusCode}');
      }
    } on SocketException {
      throw Exception('Error while fetching');
    } on TimeoutException {
      throw Exception('Time Out');
    }
  }
}
