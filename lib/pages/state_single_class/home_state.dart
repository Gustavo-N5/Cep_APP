// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep_app_bloc/model/endereco_model.dart';

enum HomeStatus {
  initial,
  loading,
  loaded,
  failure,
}

class HomeState {
  final EnderecoModel? enderecoModel;
  final HomeStatus status;

  HomeState({
    this.status = HomeStatus.initial,
    this.enderecoModel,
  });

  HomeState copyWith({
    EnderecoModel? enderecoModel,
    HomeStatus? status,
  }) {
    return HomeState(
      enderecoModel: enderecoModel ?? this.enderecoModel,
      status: status ?? this.status,
    );
  }
}
