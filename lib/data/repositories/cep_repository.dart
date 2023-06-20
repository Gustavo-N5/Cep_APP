import '../../models/cep_model.dart';

abstract class CepRepositories {
  Future<CepModel> getCep(String cep);
}
