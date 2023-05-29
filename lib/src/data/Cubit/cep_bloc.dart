import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:via_cep/src/data/repositories/cep_repository.dart';
import 'package:via_cep/src/data/repositories/cep_repository_impl.dart';
import 'package:via_cep/src/models/cep_model.dart';
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
