import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cep_app_bloc/pages/state_subclass/home_state.dart';
import 'package:cep_app_bloc/repositories/cep_repository.dart';
import 'package:cep_app_bloc/repositories/cep_repository_impl.dart';

class HomeController extends Cubit<HomeState> {
  final CepRepository cepRepository = CepRepositoryImpl();

  HomeController() : super(HomeInitial());

  Future<void> findCep(String cep) async {
    try {
      emit(HomeLoading());
      final enderecoMdel = await cepRepository.getCep(cep);
      emit(HomeLoaded(enderecoModel: enderecoMdel));
    } catch (e) {
      emit(HomeFailaure());
    }
  }
}
