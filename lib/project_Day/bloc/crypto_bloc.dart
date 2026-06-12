import 'package:bloc/bloc.dart';
import 'package:my_bloc/project_Day/bloc/crypto_event.dart';
import 'package:my_bloc/project_Day/bloc/crypto_states.dart';
import 'package:my_bloc/project_Day/repo/crypto_repo.dart';
import 'package:my_bloc/project_Day/repo/model/crypto_model.dart';

class CryptoBloc extends Bloc<CryptoEvent, CryptoStates> {
  final CryptoRepo cryptoRepo = CryptoRepo();
  CryptoBloc() : super(CryptoStates()) {
    on<CryptoFetched>(_fetchCryptoApi);
    on<SearchCrypto>(_crytoFilterList);
  }
  void _fetchCryptoApi(CryptoFetched event, Emitter<CryptoStates> emit) async {
    await cryptoRepo
        .fetchCryptoApi()
        .then((value) {
          emit(
            state.copyWith(
              cryptoStatus: CryptoStatus.success,
              cryptoList: value,
              message: 'Success',
            ),
          );
        })
        .onError((error, stackTrace) {
          print(error);
          emit(
            state.copyWith(
              cryptoStatus: CryptoStatus.success,
              message: error.toString(),
            ),
          );
        });
  }

  void _crytoFilterList(SearchCrypto event, Emitter<CryptoStates> emit) {
    if (event.query.isEmpty) {
      emit(state.copyWith(tempCryptoList: const []));
      return;
    }
    final queryLower = event.query.toLowerCase();
    final fillterd = state.cryptoList.where((coin) {
      final matchesName = coin.name.toLowerCase().contains(queryLower);
      final matchesSymbol = coin.symbol.toLowerCase().contains(queryLower);
      return matchesName || matchesSymbol;
    }).toList();
    if (fillterd.isEmpty) {
      emit(
        state.copyWith(
          tempCryptoList: [
            CryptoModel(
              id: 'no_data_found',
              symbol: '',
              name: '',
              image: '',
              currentPrice: 0.0,
              marketCapRank: 0,
            ),
          ],
        ),
      );
    } else {
      emit(state.copyWith(tempCryptoList: fillterd));
    }
  }
}
