//  SAHI: Future<List<CryptoModel>> hona chahiye
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_bloc/project_Day/repo/model/crypto_model.dart';

class CryptoRepo {
  Future<List<CryptoModel>> fetchCryptoApi() async {
    try {
      final response = await http.get(
        Uri.parse(
          'https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=20&page=1',
        ),
      );

      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((item) {
          return CryptoModel.fromJson(item as Map<String, dynamic>);
        }).toList(); // Yeh return karega List<CryptoModel>
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
