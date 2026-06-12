import 'package:equatable/equatable.dart';

abstract class CryptoEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class CryptoFetched extends CryptoEvent {}

class SearchCrypto extends CryptoEvent {
  final String query;
  SearchCrypto(this.query);
  List<Object> get props2 => [this.query];
}
