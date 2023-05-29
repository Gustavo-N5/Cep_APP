import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:via_cep/src/models/cep_model.dart';

import 'cep_repository.dart';

class CepRepositoriesImpl implements CepRepositories {
  @override
  Future<CepModel> getCep(String cep) async {
    try {
      final result = await Dio().get('https://viacep.com.br/ws/$cep/json/');
      return CepModel.fromMap(result.data);
    } on DioError catch (e) {
      log("Erro ao buscar CEP", error: e);
      throw Exception("Erro ao buscar CEP");
    }
  }
}
