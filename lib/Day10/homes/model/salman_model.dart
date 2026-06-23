import 'package:freezed_annotation/freezed_annotation.dart';
part 'salman_model.freezed.dart';
part 'salman_model.g.dart';

@freezed
class SalmanModel with _$SalmanModel {
  factory SalmanModel({String? message}) = _SalmanModel;
  factory SalmanModel.fromJson(Map<String, dynamic> json) =>
      _$SalmanModelFromJson(json);
}
