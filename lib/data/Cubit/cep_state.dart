// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cep_bloc.dart';

abstract class CepState {}

class InitialCepState extends CepState {}

class LoadingCepState extends CepState {}

class LoadedCepState extends CepState {
  final CepModel cep;

  LoadedCepState(
    this.cep,
  );
}

class FaluereCepState extends CepState {}
