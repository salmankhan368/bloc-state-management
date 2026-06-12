import 'package:equatable/equatable.dart';
import 'package:my_bloc/project_Day/repo/model/crypto_model.dart';

class CryptoStates extends Equatable {
  final CryptoStatus cryptoStatus;
  final String message;
  final List<CryptoModel> cryptoList;
  final List<CryptoModel> tempCryptoList;
  const CryptoStates({
    this.cryptoStatus = CryptoStatus.loading,
    this.cryptoList = const <CryptoModel>[],
    this.tempCryptoList = const <CryptoModel>[],
    this.message = '',
  });
  CryptoStates copyWith({
    CryptoStatus? cryptoStatus,
    String? message,
    List<CryptoModel>? cryptoList,
    List<CryptoModel>? tempCryptoList,
  }) {
    return CryptoStates(
      cryptoList: cryptoList ?? this.cryptoList,
      cryptoStatus: cryptoStatus ?? this.cryptoStatus,
      message: message ?? this.message,
      tempCryptoList: tempCryptoList ?? this.tempCryptoList,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
    cryptoStatus,
    cryptoList,
    tempCryptoList,
    message,
  ];
}

enum CryptoStatus { loading, success, failure }
