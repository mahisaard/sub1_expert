
import 'package:equatable/equatable.dart';
import 'package:module_televisi/data/models/televisi_model.dart';

class TelevisiResponse extends Equatable {
  final List<TelevisiModel> televisiList;

  TelevisiResponse({required this.televisiList});

  factory TelevisiResponse.fromJson(Map<String, dynamic> json) => TelevisiResponse(
    televisiList: List<TelevisiModel>.from((json["results"] as List)
        .map((x) => TelevisiModel.fromJson(x))
        .where((element) => element.posterPath != null)),
  );

  Map<String, dynamic> toJson() => {
    "results": List<dynamic>.from(televisiList.map((x) => x.toJson())),
  };

  @override
  List<Object> get props => [televisiList];
}
