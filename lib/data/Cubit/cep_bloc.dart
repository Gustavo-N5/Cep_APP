import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/cep_model.dart';
import '../repositories/cep_repository.dart';
import '../repositories/cep_repository_impl.dart';
part 'cep_state.dart';

class CepBloc extends Cubit<CepState> {
  final CepRepositories repositories = CepRepositoriesImpl();
  CepBloc() : super(InitialCepState());

  Future<void> findCep({required String cep}) async {
    try {
      emit(LoadingCepState());
      var findCep = await repositories.getCep(cep);
      emit(LoadedCepState(findCep));
    } catch (e) {
      emit(FaluereCepState());
    }
  }
}
