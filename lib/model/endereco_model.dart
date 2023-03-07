import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class EnderecoModel {
  final String cep;
  final String logradouro;
  final String bairro;

  EnderecoModel({
    required this.cep,
    required this.logradouro,
    required this.bairro,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cep': cep,
      'logradouro': logradouro,
      'bairro': bairro,
    };
  }

  factory EnderecoModel.fromMap(Map<String, dynamic> map) {
    return EnderecoModel(
      cep: map['cep'],
      logradouro: map['logradouro'],
      bairro: map['bairro'],
    );
  }

  String toJson() => json.encode(toMap());

  factory EnderecoModel.fromJson(String source) =>
      EnderecoModel.fromMap(json.decode(source));
}
