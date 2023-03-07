// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cep_app_bloc/model/endereco_model.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeFailaure extends HomeState {}

class HomeLoaded extends HomeState {
  final EnderecoModel enderecoModel;

  HomeLoaded({
    required this.enderecoModel,
  });
}
